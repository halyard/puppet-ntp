# == Class: ntp
#
# Set up ntp syncing
#
# === Parameters
#
# === Example
#
#   class { 'ntp': }
#

class ntp (
  Array[String] $servers = ['time1.google.com', 'time2.google.com', 'time3.google.com', 'time4.google.com']
) {
  case $::osfamily {
    'Archlinux': { include ntp::archlinux }
    'Arch': { include ntp::archlinux }
    default: { fail("Hostname module does not support ${::osfamily}") }
  }
}
