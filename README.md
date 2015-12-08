# ConfigThePenguin
[ConfigThePenguin](https://github.com/sljrobin/ConfigThePenguin) is a toolbox for automating the installation process of [Arch Linux](https://www.archlinux.org/) and [Debian](https://www.debian.org/). It contains my personal dotfiles and a bunch of handy scripts. Find more information on the [project's webpage](https://sljrobin.org/work/configthepenguin).

## Table of contents
* [Content](https://github.com/sljrobin/ConfigThePenguin#content)
* [Configuration](https://github.com/sljrobin/ConfigThePenguin#configuration)
* [Script options](https://github.com/sljrobin/ConfigThePenguin#script-options)
* [Installation](https://github.com/sljrobin/ConfigThePenguin#installation)
* [License](https://github.com/sljrobin/ConfigThePenguin#license)

## Content
The repository is divided into several directories:
* [`dotfiles/`](/dotfiles/) _Configuration files for various applications_
    * [`/`](/dotfiles/)
    * [`ncmpcpp/`](/dotfiles/ncmpcpp)
* [`scripts/`](/scripts/) _Installation scripts_

## Configuration
* __Environment__
    * Shell: [Zsh](http://www.zsh.org/)
    * Terminal: [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html)
    * Multiplexer: [tmux](https://tmux.github.io/)
    * Monitor: [Conky](https://github.com/brndnmtthws/conky)
    * GUI: [X](http://www.x.org/wiki/)/[xmonad](http://xmonad.org/)
* __Development__
    * Editor: [vim](http://www.vim.org/)
    * VCS: [Git](https://git-scm.com/)
* __Multimedia__
    * Music: [MPD](http://www.musicpd.org/)/[ncmpcpp](http://rybczak.net/ncmpcpp/)
    * Video: [mpv](https://mpv.io/)
* __Clients__
    * IRC: [WeeChat](https://weechat.org/)
    * RSS: [Newsbeuter](http://newsbeuter.org/)
    * Mail: [Mutt](http://www.mutt.org/)
    * BitTorrent: [rTorrent](https://rakshasa.github.io/rtorrent/)

## Script options
Only the `main.sh` script needs to be executed. Help can be printed with the `-H` or `--help` arguments.
* __Syntax__: `./main.sh <argument 1><argument 2> <argument 3>`
* __Arguments 1__
    * `-a` _Arch Linux_
    * `-d` _Debian_
    * `-m` _Multi_
* __Arguments 2__
    * `.` _dotfiles_
    * `d` _drivers_
    * `p` _packages_
    * `s` _settings_
* __Arguments 3__
    * For _Drivers_
        * `lenovo-x250` _drivers for Lenovo ThinkPad X250_
    * For _Packages_
        * `-A` | `--all` _select all suboptions_
        * `-d` | `--development` _software/hardware development_
        * `-g` | `--gui` _graphical user interface_
        * `-m` | `--media` _audio and video_
        * `-n` | `--network` _web surfing, WiFi, VPN_
        * `-u` | `--utils` _archive extractors, clients, readers_
    * For _Settings_
        * `base16` _clone repository from GitHub_
        * `firefox` _print details add-ons_
        * `mpd` _create directories for MPD_
        * `rtorrent` _create directories for rTorrent_
        * `vim` _install plugins_
        * `xmonad` _compile xmonad with the main configuration file_
        * `zsh` _change the current shell to Zsh_

## Installation
Examples of classical installations:
* __Arch__
* __Debian__
    1. `./main.sh -dp -A`
    2. `./main.sh -m.`
    3. `./main.sh -ms -A`
    4. `./main.sh -dd <PC>`

## License
The content of this project is licensed under the GPL license.
