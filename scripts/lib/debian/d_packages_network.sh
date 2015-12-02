#!/bin/bash

########################################################################################################################
# Debian | Packages | Install main Packages for Network
#    curl: tool to transfer a url
#    ethtool: utility to get information about Network Interface Controllers
#    iceweasel: web browser
#    flashplugin-nonfree: Adobe Flash
#    nslookup: manage DNS queries
#    openvpn: VPN
#    rtorrent: BitTorrent client
#    wicd-curses: wired and wireless network manager
#    whois: tool for querying Whois database
function __d_packages_net_main()
{
  aptitude install \
    curl \
    ethtool \
    iceweasel \
    flashplugin-nonfree \
    nslookup \
    openvpn \
    rtorrent \
    wicd-curses \
    whois
}


########################################################################################################################
# Debian | Packages | Install Packages for Network
function d_packages_net()
{
  # Net | Main packages
  colorize "[1/${STP_D_PKG_NET}] Installing Debian Network Packages (Main)..." $CLR_LBLUE "y"
  __d_packages_net_main
  colorize "[1/${STP_D_PKG_NET}] Installing Debian Network Packages (Main)..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
