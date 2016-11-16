<p align="center">
	<a href="http://marseditor.com/"><img src="https://raw.githubusercontent.com/marseditor/mars/master/extras/logo/logo_min.png" height="384"></a>
	<br />
    <sup>
        <strong>
            Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases">CBA A3</a>
        </strong>
        <br /><br />
    </sup>
    <a href="https://github.com/marseditor/mars/issues">
        <img src="https://img.shields.io/github/issues-raw/marseditor/mars.svg?label=issues" alt="Mars Issues">
    </a>
    <a href="https://github.com/marseditor/mars/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-GPLv3-red.svg?label=license" alt="Mars License">
    </a>
    <a href="https://travis-ci.org/marseditor/mars">
        <img src="https://img.shields.io/travis/marseditor/mars.svg?label=build" alt="Mars Build Status">
    </a>
</p>

## Motivation
Mars is designed with large communities in mind. When you are the game master for a mission, you take on a big responsibility to deliver a fun experience to the players. Current implementations for real-time control don't offer enough detail and cause a lot of headaches when trying to do specific things. The goal of Mars is to create a platform that is extensible and robust, allowing communities to create their own additions and customise it to suit their needs.

![Image](https://mars.arcomm.co/images/posts/framework-release/interface_01n.jpg)

## Extensibility
Mars follows the same development environment and coding guidelines as ACE3 - for a strong foundation, and familiar design. With it you can easily adapt the editor to your community's modset and playstyle. All it takes is a few config files and functions, and in a short amount of time you'll be able to improve the quality of a mission, and with it the players' experience.

![Image](https://mars.arcomm.co/images/posts/framework-release/interface_03.jpg)

## Contributing
You can help out with the ongoing development by looking for potential bugs in the code base, or by contributing new features. To help out, simply fork the repository and submit your pull requests for review by other collaborators. Feel free to also join the [Discord](https://discord.gg/0vfzEmmrAOu1T2uk) server to discuss, develop and troubleshoot.

![Image](https://mars.arcomm.co/images/posts/framework-release/interface_04.jpg)

## Coding Guidelines
This project follows the [ACE3 coding guidelines](http://ace3mod.com/wiki/development/coding-guidelines.html). Here's some basic rules:
* Mars' only dependency is CBA. Let's keep it that way.
* Any addons that require a third-party mod must be put into the `optionals` folder
* Use 4 spaces for indentation
* Use camel case
* Use the standard [function header](http://ace3mod.com/wiki/development/coding-guidelines.html#headers) when writing functions
* Braces should be on the same line
* Make sure you've read [this article](http://chris.beams.io/posts/git-commit) on commit messages
