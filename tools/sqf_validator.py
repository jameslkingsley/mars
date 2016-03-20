#!/usr/bin/env python3

import fnmatch
import os
import re
import ntpath
import sys
import argparse

def validKeyWordAfterCode(content, index):
	keyWords = ["for", "do", "count", "each", "forEach", "else", "and", "not", "isEqualTo", "in", "call", "spawn", "execVM", "catch"];
	for word in keyWords:
		try:
			subWord = content.index(word, index, index+len(word))
			return True;
		except:
			pass
	return False

def check_sqf_syntax(filepath):
	bad_count_file = 0
	def pushClosing(t):
		closingStack.append(closing.expr)
		closing << Literal( closingFor[t[0]] )

	def popClosing():
		closing << closingStack.pop()

	with open(filepath, 'r', encoding='utf-8', errors='ignore') as file:
		content = file.read()
		brackets_list = []
		isInCommentBlock = False
		checkIfInComment = False
		ignoreTillEndOfLine = False
		checkIfNextIsClosingBlock = False
		isInString = False
		inStringType = '';
		lastIsCurlyBrace = False
		checkForSemiColumn = False
		lineNumber = 0
		indexOfCharacter = 0

		for c in content:
			if (lastIsCurlyBrace):
				lastIsCurlyBrace = False
				checkForSemiColumn = True

			if c == '\n':
				lineNumber += 1
			if (isInString):
				if (c == inStringType):
					isInString = False
			elif (isInCommentBlock == False):
				if (checkIfInComment):
					checkIfInComment = False
					if c == '*':
						isInCommentBlock = True
					elif (c == '/'):
						ignoreTillEndOfLine = True
				if (isInCommentBlock == False):
					if (ignoreTillEndOfLine):
						if (c == '\n'):
							ignoreTillEndOfLine = False
					else:
						if (c == '"' or c == "'"):
							isInString = True
							inStringType = c
						elif (c == '#'):
							ignoreTillEndOfLine = True
						elif (c == '/'):
							checkIfInComment = True
						elif (c == '('):
							brackets_list.append('(')
						elif (c == ')'):
							if (brackets_list[-1] in ['{', '[']):
								print("ERROR: Possible missing round bracket ')' detected at {0} Line number: {1}".format(filepath,lineNumber))
								bad_count_file += 1
							brackets_list.append(')')
						elif (c == '['):
							brackets_list.append('[')
						elif (c == ']'):
							if (brackets_list[-1] in ['{', '(']):
								print("ERROR: Possible missing square bracket ']' detected at {0} Line number: {1}".format(filepath,lineNumber))
								bad_count_file += 1
							brackets_list.append(']')
						elif (c == '{'):
							brackets_list.append('{')
						elif (c == '}'):
							lastIsCurlyBrace = True
							if (brackets_list[-1] in ['(', '[']):
								print("ERROR: Possible missing curly brace '}}' detected at {0} Line number: {1}".format(filepath,lineNumber))
								bad_count_file += 1
							brackets_list.append('}')
						if (checkForSemiColumn):
							if (c not in [' ', '\t', '\n', '/']):
								checkForSemiColumn = False
								if (c not in [']', ')', '}', ';', ',', '&', '!', '|', '='] and not validKeyWordAfterCode(content, indexOfCharacter)):
									print("ERROR: Possible missing semi-column ';' detected at {0} Line number: {1}".format(filepath,lineNumber))
									bad_count_file += 1
			else:
				if (c == '*'):
					checkIfNextIsClosingBlock = True;
				elif (checkIfNextIsClosingBlock):
					if (c == '/'):
						isInCommentBlock = False
					elif (c != '*'):
						checkIfNextIsClosingBlock = False
			indexOfCharacter += 1

		if brackets_list.count('[') != brackets_list.count(']'):
			print("ERROR: A possible missing square bracket [ or ] in file {0} [ = {1} ] = {2}".format(filepath,brackets_list.count('['),brackets_list.count(']')))
			bad_count_file += 1
		if brackets_list.count('(') != brackets_list.count(')'):
			print("ERROR: A possible missing round bracket ( or ) in file {0} ( = {1} ) = {2}".format(filepath,brackets_list.count('('),brackets_list.count(')')))
			bad_count_file += 1
		if brackets_list.count('{') != brackets_list.count('}'):
			print("ERROR: A possible missing curly brace {{ or }} in file {0} {{ = {1} }} = {2}".format(filepath,brackets_list.count('{'),brackets_list.count('}')))
			bad_count_file += 1
	return bad_count_file

def main():
	print("Validating SQF")

	sqf_list = []
	bad_count = 0
	parser = argparse.ArgumentParser()
	parser.add_argument('-m','--module', help='only search specified module addon folder', required=False, default="")
	args = parser.parse_args()
	rootDir = "../addons"
	
	if (os.path.exists("addons")):
		rootDir = "addons"

	for root, dirnames, filenames in os.walk(rootDir + '/' + args.module):
		for filename in fnmatch.filter(filenames, '*.sqf'):
			sqf_list.append(os.path.join(root, filename))

	for filename in sqf_list:
		bad_count = bad_count + check_sqf_syntax(filename)

	print("------\nChecked {0} files\nErrors detected: {1}".format(len(sqf_list), bad_count))
	if (bad_count == 0):
		print("SQF validation PASSED")
	else:
		print("SQF validation FAILED")

	return bad_count

if __name__ == "__main__":
	sys.exit(main())