#!/bin/bash
#
#        Filename: d_packages_network.sh
#     Description: ConfigThePenguin | Debian - Packages - Network
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-02-10 21:24:54
#        Modified: 2016-02-10 21:51:52
#
########################################################################################################################
# Debian | Packages | Install Packages for Network
#    bitlbee: IRC Gateway
#    curl: tool to transfer a url
#    ethtool: utility to get information about Network Interface Controllers
#    geoip-bin: tool to look up the geographic location of an IP address
#    iceweasel: web browser
#    fail2ban: IPS
#    flashplugin-nonfree: Adobe Flash
#    nginx: HTTP server and reverse proxy
#    nslookup: tool to manage DNS queries
#    openvpn: VPN
#    rkhunter: Rootkit Hunter
#    rtorrent: BitTorrent client
#    ssh: Secure Shell
#    weechat: IRC Client
#    wicd-curses: wired and wireless network manager
#    wireshark: network protocol analyzer
#    whois: tool for querying Whois database
#    znc: IRC Bouncer
function d_packages-net_install()
{
  # List
  plnet=$(whiptail --title "Debian | Packages | Network" --checklist \
    "\nSelect Debian Packages to install for Network" 26 97 18 \
    "bitlbee" "IRC Gateway" OFF \
    "curl" "Tool to transfer a url" ON \
    "ethtool" "Utility to get information about Network Interface Controllers" ON \
    "geoip-bin" "Tool to look up the geographic location of an IP address" ON \
    "iceweasel" "Web browser" ON \
    "fail2ban" "IPS" OFF \
    "flashplugin-nonfree" "Adobe Flash" ON \
    "nginx" "HTTP server and reverse proxy" OFF \
    "nslookup" "Tool to manage DNS queries" ON \
    "openvpn" "VPN" ON \
    "rkhunter" "Rootkit Hunter" OFF \
    "rtorrent" "BitTorrent client" ON \
    "ssh" "Secure Shell" ON \
    "weechat" "IRC Client" ON \
    "wicd-curses" "Wired and wireless network manager" ON \
    "wireshark" "network protocol analyzer" ON \
    "whois" "Tool for querying Whois database" ON \
    "znc" "IRC Bouncer" OFF 3>&1 1>&2 2>&3)
  # Exit status
  pl_status=$?
  # 'OK' option selected
  if [ $pl_status = 0 ]; then
    ctp-pkgs_d-install "Network" $STP_D_PKG_NET "$plnet"
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}
