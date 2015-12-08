# ConfigThePenguin
An other personal Linux configuration.

## Table of contents
* [Content]
* [License]

## Content
The repository is divided into several directories:
* [`dotfiles/`](/dotfiles/) _Configuration files for various applications_
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

## Installation
* __Arch__
* __Debian__
    1. `./main -dp -A`


#### [`dotfiles/`]
* __[Conky]__ [`.conkyrc`]
* __[Git]__ [`.gitconfig`] 
* __[Newsbeuter]__
    * [`config`] _Newsbeuter - Configuration_
    * [`urls`] _Newsbeuter - URLs_
* __[rTorrent]__ [`.rtorrent.rc`]
* __[tmux]__ [`.tmux.conf`]
* __[vim]__ [`.vimrc`]
* __[X.Org]__
    * [`.xinitrc`] _X.Org - Starting script_
    * [`.Xresources`] _X.Org - Parameters for X client applications_
* __[xmonad]__
    * [`data/`] _xmonad - Conky/Icons/Scripts_
    * [`lib/`] _xmonad - External configuration files_
    * [`xmonad.hs`] _xmonad - Main configuration file_
* __[Zsh]__
    * [`.zshrc`] _Zsh - Main configuration file_

#### [`scripts/`]
* [`core/`] _Variables and functions_
* [`lib/`](/scripts/lib/) _Library_
    * [`arch/`] _Scripts for Arch Linux only_
    * [`debian/`] _Scripts for Debian only_
    * [`multi/`] _Common scripts for Linux distributions_
* [`main.sh`] _Main script_

## Information
#### Scripts options
* Syntax: `<Argument 1><Argument 2> <Argument 3>`
* Arguments
    * Arguments 1
        * `-a` _Arch Linux_
        * `-d` _Debian_
        * `-m` _Multi_
    * Arguments 2
        * `.` _dotfiles_
        * `d` _drivers_
        * `p` _packages_
        * `s` _settings_
* Available options
* `ms`
    * `firefox`
    * `rtorrent`
    * `vim`
    * `zsh`
            
#### vim
* Colorscheme: [base16]
* Plugin manager: [Vundle]
* Plugins
    * [Command-T]
    * [delimitMate]
    * [indentLine]
    * [NERDTree]
    * [surround]
    * [Taglist]
    * [vim-multiple-cursors]
    * [YouCompleteMe]


## License
The content of this project is licensed under the GPL license.


[Content]: /README.md#content "Content"

[Information]: /README.md#information "Information"
[License]: /README.md#license "License"

[`.conkyrc`]: /dotfiles/.conkyrc ".conkyrc"
[`.gitconfig`]: /dotfiles/.gitconfig ".gitconfig"
[`.rtorrent.rc`]: /dotfiles/.rtorrent.rc ".rtorrent.rc"
[`.tmux.conf`]: /dotfiles/.tmux.conf ".tmux.conf"
[`.vimrc`]: /dotfiles/.vimrc ".vimrc"
[`.xinitrc`]: /dotfiles/.xinitrc ".xinitrc"
[`.Xresources`]: /dotfiles/.Xresources ".Xresources"
[`.zshrc`]: /dotfiles/.zshrc ".zshrc"

[`config`]: /dotfiles/.newsbeuter/config "config"
[`core/`]: /scripts/core/ "core/"
[`data/`]: /dotfiles/.xmonad/data "data/"
[`lib/`]: /dotfiles/.xmonad/lib "lib/"
[`main.sh`]: /scripts/main.sh "main.sh"
[`scripts/`]: /scripts/ "scripts/"
[`urls`]: /dotfiles/.newsbeuter/urls "urls"
[`xmonad.hs`]: /dotfiles/.xmonad/xmonad.hs "xmonad.hs"

[Conky]: https://github.com/brndnmtthws/conky "Conky"
[Git]:  "Git"
[rTorrent]: https://rakshasa.github.io/rtorrent/ "rTorrent"
[X.Org]: http://www.x.org/ "X.Org"

[base16]: https://github.com/chriskempson/base16-vim "base16"
[Command-T]: https://github.com/wincent/Command-T "Command-T"
[delimitMate]: https://github.com/Raimondi/delimitMate "delimitMate"
[indentLine]: https://github.com/Yggdroot/indentLine "indentLine"
[NERDTree]: https://github.com/scrooloose/nerdtree "NERDTree"
[Vundle]: https://github.com/VundleVim/Vundle.vim "Vundle"
[surround]: https://github.com/tpope/vim-surround "surround"
[Taglist]: http://vim-taglist.sourceforge.net/ "Taglist"
[vim-multiple-cursors]: https://github.com/terryma/vim-multiple-cursors "vim-multiple-cursors"
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe "YouCompleteMe"
