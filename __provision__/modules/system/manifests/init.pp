# Class: system
#
#
class system {
    package { 'git':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    package { 'python3-pip':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    package { 'vim':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    file { 'NS-API message':
        path => '/etc/update-motd.d/52-message',
        ensure => file,
        source => 'puppet:///modules/system/52-message',
        mode => 555,
    }
}
