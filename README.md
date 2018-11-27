# `gitcheck`

## Overview

[Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) shell script that checks for [`git`](https://git-scm.com/) repositories in the current folder and its children and displays a report.


## Installation

Clone the repository into `/usr/local/gitcheck`. You can clone it anywhere you like but make sure you update the paths.

	cd /usr/local
	git clone https://github.com/pbougie/gitcheck.git

Add `/usr/local/gitcheck` to your `PATH` environment.

	echo 'export PATH=/usr/local/gitcheck:$PATH' >> ~/.bash_profile

Reload the shell.

	source ~/.bash_profile


## Upgrade

To upgrade the script to the latest version.

	cd /usr/local/gitcheck
	git pull


## Usage

To execute the command.

	$ cd <path/to/search>
	$ gitcheck.sh

To exclude any path pattern.

	$ cd <path/to/search>
	$ gitcheck.sh -x .bundle

Simple as that. It can take a little time depending on the size of the folder structure you're searching.


---
© [Patrick Bougie](http://patrickbougie.com/).
All Rights Reserved.
