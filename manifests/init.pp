# @summary NTP sync configuration
#
# @param servers NTP server list for time sync
class ntp (
  Array[String] $servers = ['time1.google.com', 'time2.google.com', 'time3.google.com', 'time4.google.com']
) {
  case $facts['os']['family'] {
    'Archlinux': { include ntp::archlinux }
    'Arch': { include ntp::archlinux }
    default: { fail("Hostname module does not support ${facts['os']['family']}") }
  }
}
