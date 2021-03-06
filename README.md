# ModMacs
_ModMacs_ is a minimal emacs framework for package experimentation and full user customization.

Above all else, _ModMacs_ aims to be:

* __Minimal__ - It shall not impose undo burden on a user's operation of emacs, in performance or otherwise..
* __Moldable__ - It shall provide full and easy user customization without restriction.
* __Safe__ - As much as possible, while adhering to other objectives, it shall prevent user configuration error.

At the end of the day, _ModMacs_ does very little, and that's the goal-- _ModMacs_ should do everything necessary to achieve these simple objectives, and nothing more.

## Features
_Current:_
* Fast load
* Drop-in custom, user-created modules 
* White/blacklist for toggling your modules
* A set of core emacs convenience functions

_To Be Released_
* Package collision checking
* Key binding collision checking
* Module loading error handling
* Profiling of common user actions

## Getting Started
1. Add packages and configurations to the `modules` directory in the form of *.el files. 
1. Edit `keybindings.el` with your desired key bindings.

## Design & Operation
_ModMacs_ contains only three user-editable files/directories:

* Add *.el to `modules/` and _ModMacs_ will load them.
* Edit the whitelist and/or blacklist in `modules.el` to keep from loading all modules in `modules/`. Note that the blacklist overrides the whitelist _(whitelist - blacklist = loaded modules)_.
* If you want anything more than default key bindings, add them to `keybindings.el`. Key bindings are the last configuration loaded by _ModMacs_, letting them override anything set by included modules.

## Just another Emacs framework?
Everyone and their mother makes an Emacs framework that suits some amount of customization while introducing the user to a handful of popular packages. Why am I making another? While I appreciate the work others have put into creating emacs frameworks, they all feel bulky to me. They provide default packages, or layers of packages, that users may toggle on and off. They provide sets of "common" keybindings. They expose package variables and create new variables to control their custom functions. These all work very well within the confines of each framework's cookie cutter environment.

But... to take full advantage of these frameworks, you must learn all its settings and key bindings. You must suffer each framework's default settings for each package it includes (why does everyone insist on defaulting to 2-space indent!?). Adding and experimenting with new packages becomes an hours-long task because you're not familiar with the inner workings of the framework. And worst, if you're coming to the table with an Emacs configuration that you've already cultivated, rarely a simple way exists to migrate it to these frameworks. 

## Where to find packages
* https://github.com/emacs-tw/awesome-emacs
