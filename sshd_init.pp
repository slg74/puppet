class sshd {
  package { 'openssh-server':
    ensure => present,
    before => Service['sshd'],
  }
  service { 'sshd':
    ensure  => running,
    enable  => true,
    require => Package['openssh-server'],
  }

  file { '/etc/ssh/sshd_config':
    ensure  => file,
    source  => 'puppet://modules/sshd/sshd_config',
    require => Package['openssh-server'],
  }
}
