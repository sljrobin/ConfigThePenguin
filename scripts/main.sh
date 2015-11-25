#!/bin/bash
#
#        Filename: main.sh
#     Description: ConfigThePenguin - Main script 
#          Author: Simon L. J. Robin - http://sljrobin.com
#         Created: 2015-10-18 15:20:37
#        Modified: 2015-11-25 11:09:24
#
########################################################################################################################
# Load Core
source ./core/ctp_var.sh
source ./core/ctp_func.sh

# Load Library: Applications scripts
source ./lib/apps/firefox.sh
source ./lib/apps/rtorrent.sh
source ./lib/apps/vim.sh
source ./lib/apps/xmonad.sh

# Load Library: OS scripts
source ./lib/os/debian/customization.sh
source ./lib/os/debian/initialization.sh
source ./lib/os/debian/packages.sh

# Load Library: PC scripts 
source ./lib/pc/lenovo-x250_debian.sh


########################################################################################################################




while true; do
  case $1 in
    # > Apps
    -a | --apps)
      shift
      case $1 in
        # > Apps > Firefox
        firefox)
          shift
          case $1 in
            # > Apps > Firefox > Add-ons
            -a | --addons)
              m_settings_firefox
              ;;
            # > Apps > Firefox > Miscellaneous
            -*) args_invalid $1 ;;       # Invalid argument
             *) args_insufficient $1 ;;  # Insufficient number of arguments
          esac
          break
          ;;
        # > Apps > rTorrent
        rtorrent)
          shift
          case $1 in
            # > Apps > rTorrent > Installation
            -i | --install)
              shift
              args_apps_rtorrent_install
              break
              ;;
            # > Apps > rTorrent > Miscellaneous
            -*) args_invalid $1 ;;       # Invalid argument
             *) args_insufficient $1 ;;  # Insufficient number of arguments
          esac
          break
          ;;
        # > Apps > vim
        vim)
          shift
          case $1 in
            # > Apps > vim > Installation
            -i | --install)
              shift
              args_apps_vim_install $1
              ;;
            # > Apps > vim > Miscellaneous
            -*) args_invalid $1 ;;       # Invalid argument
             *) args_insufficient $1 ;;  # Insufficient number of arguments
          esac
          break
          ;;
        # > Apps > xmonad
        xmonad)
          shift
          case $1 in
            # > Apps > xmonad > Installation
            -i | --install)
              args_apps_xmonad_install
              ;;
            # > Apps > xmonad > Update
            -u | --update)
              args_apps_xmonad_update
              ;;
            # > Apps > xmonad > Miscellaneous
            -*) args_invalid $1 ;;       # Invalid argument
             *) args_insufficient $1 ;;  # Insufficient number of arguments
          esac
          break
          ;;
        # > Apps > Miscellaneous (Invalid argument)
        *)
          args_invalid $1
          break
          ;;
      esac
      break
      ;;
    # > Help
    -h | --help)
      args_help
      break
      ;;
    # > OS
    -o | --os)
      shift
      case $1 in
        # > OS > Debian
        debian)
          shift
          case $1 in
            # > OS > Debian > Installation
            -i | --install)
              shift
              args_os_debian_install $1
              ;;
            # > OS > Debian > Update
            -u | --update)
              shift
              args_os_debian_update $1
              ;;
            # > OS > Debian > Miscellaneous
            -*) args_invalid $1 ;;       # Invalid argument
             *) args_insufficient $1 ;;  # Insufficient number of arguments
          esac
          break
          ;;
        # > OS > Miscellaneous (Invalid argument)
        *)
          args_invalid $1
          break
          ;;
      esac
      break
      ;;
    # > PC
    -p | --pc)
      shift
      case $1 in
        # > PC > Lenovo X250
        lenovox250)
          shift
          case $1 in
            # > PC > Lenovo X250 > Installation
            -i | --install)
              shift
              case $1 in
                # > PC > Lenovo X250 > Installation > Debian
                debian)
                  shift
                  args_pc_lenovox250_debian_install $1
                  ;;
                # > PC > Lenovo X250 > Installation > Miscellaneous
                *) args_invalid $1 ;;       # Invalid argument
              esac
              break
              ;;
            # > PC > Lenovo X250 > Miscellaneous
            -*) args_invalid $1 ;;       # Invalid argument
             *) args_insufficient $1 ;;  # Insufficient number of arguments
          esac
          break
          ;;
        # > PC > Miscellaneous (Invalid argument)
        *)
          args_invalid $1
          break
          ;;
      esac
      break
      ;;
    # > Miscellaneous (Invalid argument)
    *)
      args_invalid $1
      break
      ;;
  esac
done
