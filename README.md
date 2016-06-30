<p align="center">
	<img src="https://raw.githubusercontent.com/jameslkingsley/Mars/master/extras/logo/logo_min.png" height="384">
	<br />
    <sup>
        <strong>
            Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases">CBA A3</a>
            <br />
            Using Arma 3 1.60 (Stable)
        </strong>
        <br /><br />
    </sup>
    <a href="https://github.com/jameslkingsley/Mars/issues">
        <img src="https://img.shields.io/github/issues-raw/jameslkingsley/Mars.svg?label=issues" alt="Mars Issues">
    </a>
    <a href="https://github.com/jameslkingsley/Mars/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-GPLv3-red.svg?label=license" alt="Mars License">
    </a>
    <a href="https://mars-slackin.herokuapp.com/">
        <img src="https://mars-slackin.herokuapp.com/badge.svg?label=slack" alt="Mars Slack">
    </a>
    <a href="https://travis-ci.org/jameslkingsley/Mars">
        <img src="https://img.shields.io/travis/jameslkingsley/Mars.svg?label=build" alt="Mars Build Status">
    </a>
</p>

## Motivation
Mars is designed with large communities in mind. When you're the game master for a mission, you take on a big responsibility to deliver a fun experience to the players. Current implementations for real-time control don't offer enough detail and cause a lot of headaches when trying to do very specific things. The goal of Mars is to create a platform that's extensible and robust allowing communities to create their own additions and customise Mars to suit their needs.

## Extensibility
Mars follows the same development environment and coding guidelines as ACE3 which not only makes it robust and modular, but also familiar. Mars is a mod for the Arma community as a whole. If you create an addition for Mars that could benefit others, you are expected to share it. Creating additions that only apply to your group, for example calling functions from your own mission framework or modset etc. is a reasonable excuse to keep it private.

## Contributing
You can help out with the ongoing development by looking for potential bugs in the code base, or by contributing new features. To contribute something to Mars, simply fork the repository and submit your pull requests for review by other collaborators. Feel free to join our [Slack](https://mars-slackin.herokuapp.com) for help on setting up Mars and discussing its development.

## Coding Guidelines
This project follows the [ACE3 coding guidelines](http://ace3mod.com/wiki/development/coding-guidelines.html). Here's some basic rules:
* Mars' only dependency is CBA. Let's keep it that way.
* Any addons that require a third-party mod must be put into the `optionals` folder
* Use 4 spaces for indentation
* Use camel case
* Use the standard [function header](http://ace3mod.com/wiki/development/coding-guidelines.html#headers) when writing functions
* Braces should be on the same line
* Make sure you've read [this article](http://chris.beams.io/posts/git-commit) on commit messages