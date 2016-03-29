import re
import glob

count = 0

def log_line(file, line, msg):
	global count
	count += 1
	if file.startswith("../addons\\"):
		file = file[12:]
	print('{}	{} @ line {} - {}'.format(count, file, line, msg))

for filename in glob.iglob('../addons/**/*.sqf', recursive=True):
	with open(filename, 'r') as script:
		l = 0;
		for line in script.readlines():
			l += 1
			
			# if statements
			if (re.search('if\(([\s\S]*)\)', line)) or (re.search('then[\s]*\n{', line)):
				log_line(script.name, l, "if statement must have a space before condition and opening brace must be on the same line")
				
			# switch statements
			if (re.search('switch[\s]*\(([\s\S]*)\)[\s]*do[\s]*\n', line)) or (re.search('case[\s\S]*:[\s]*\n', line)):
				log_line(script.name, l, "opening switch/case statement brace should be on the same line")
				
			# trailing white space
			if re.search(';[\s]+\n', line):
				log_line(script.name, l, "trailing white space")

for filename in glob.iglob('../addons/**/*.hpp', recursive=True):
	with open(filename, 'r') as script:
		l = 0;
		for line in script.readlines():
			l += 1
			
			# safeZone strings
			if re.search('=[\s]*"\([\s]*', line):
				log_line(script.name, l, "safeZone string shouldn't have unnecessary whitespace between parentheses")
			
			# arrays
			if re.search('\[\][\s]*=[\s]*[\n]', line):
				log_line(script.name, l, "opening array brace should be on the same line")
			
			# assignments
			if re.search('([\S]=[\S])|([\S]*[\s]*=[\S])|([\S]=[\s]*[\S])', line):
				log_line(script.name, l, "assignment operator must have one space either side of it")
			
			# trailing white space
			if re.search(';[\s]+\n', line):
				log_line(script.name, l, "trailing white space")

input()