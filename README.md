# ConfigThePenguin
An other personal Linux configuration.

## Table of contents
* [Content]
* [License]

## Content
The repository is divided into several directories:
* [`dotfiles/`] _Configuration files for various applications_
* [`scripts/`] _Installation scripts_

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
[vim]: /README.md#vim "vim"

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
[`dotfiles/`]: /dotfiles/ "dotfiles/"
[`data/`]: /dotfiles/.xmonad/data "data/"
[`lib/`]: /dotfiles/.xmonad/lib "lib/"
[`main.sh`]: /scripts/main.sh "main.sh"
[`scripts/`]: /scripts/ "scripts/"
[`urls`]: /dotfiles/.newsbeuter/urls "urls"
[`xmonad.hs`]: /dotfiles/.xmonad/xmonad.hs "xmonad.hs"

[Conky]: https://github.com/brndnmtthws/conky "Conky"
[Git]: https://git-scm.com/ "Git"
[Newsbeuter]: http://newsbeuter.org/ "Newsbeuter"
[tmux]: https://tmux.github.io/ "tmux"
[rTorrent]: https://rakshasa.github.io/rtorrent/ "rTorrent"
[vim]: http://www.vim.org/ "vim"
[X.Org]: http://www.x.org/ "X.Org"
[xmonad]: http://xmonad.org/ "xmonad"
[Zsh]: http://www.zsh.org/ "Zsh"

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
