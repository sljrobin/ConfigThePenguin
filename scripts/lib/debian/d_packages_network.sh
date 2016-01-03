#!/bin/bash

########################################################################################################################
# Debian | Packages | List Packages for Network
#    curl: tool to transfer a url
#    ethtool: utility to get information about Network Interface Controllers
#    geoip-bin: tool to look up the geographic location of an IP address
#    iceweasel: web browser
#    flashplugin-nonfree: Adobe Flash
#    nginx: HTTP server and reverse proxy
#    nslookup: tool to manage DNS queries
#    openvpn: VPN
#    rtorrent: BitTorrent client
#    wicd-curses: wired and wireless network manager
#    whois: tool for querying Whois database
function __d_packages-net_list()
{
  # List
  plnet=$(whiptail --title "Debian | Packages | Network" --checklist \
    "\nSelect Debian Packages to install for Network" 18 97 10 \
    "curl" "Tool to transfer a url" ON \
    "ethtool" "Utility to get information about Network Interface Controllers" ON \
    "geoip-bin" "Tool to look up the geographic location of an IP address" ON \
    "iceweasel" "Web browser" ON \
    "flashplugin-nonfree" "Adobe Flash" ON \
    "nginx" "HTTP server and reverse proxy" OFF \
    "nslookup" "Tool to manage DNS queries" ON \
    "openvpn" "VPN" ON \
    "rtorrent" "BitTorrent client" ON \
    "wicd-curses" "Wired and wireless network manager" ON \
    "whois" "Tool for querying Whois database" ON 3>&1 1>&2 2>&3)
  # Exit status
  pl_status=$?
  # 'OK' option selected
  if [ $pl_status = 0 ]; then
    # Clean the package list
    pl_cleaned=$(ctp-parser_rmdquotes "$plnet")
    echo $pl_cleaned
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}


########################################################################################################################
# Debian | Packages | Install Packages for Network
function d_packages-net_install()
{
  ctp-pkgs_d-install "Network" $STP_D_PKG_NET __d_packages-net_list
}
