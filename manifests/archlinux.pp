##
# Definitions for Archlinux
class ntp::archlinux {
  $servers = $ntp::servers

  file { '/etc/systemd/timesyncd.conf':
    ensure  => file,
    content => template('ntp/timesyncd.conf.erb'),
  }
  -> service { 'systemd-timesyncd':
    ensure => running,
    enable => true,
  }
}
