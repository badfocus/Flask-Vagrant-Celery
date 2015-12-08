# Class: nginx
#
#
class nginx {
    
    package { 'nginx':
        ensure => installed,
        require => Exec["apt-get update"],
    }

    service { 'nginx':
        enable      => true,
        ensure      => running,
        require => Package['nginx'],
    }

    file { 'vagrant-nginx':
        path => '/etc/nginx/sites-available/prueba',
        ensure => file,
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/prueba',
    }

    file { 'default-nginx-disable':
        path => '/etc/nginx/sites-enabled/default',
        ensure => absent,
        require => Package['nginx'],
    }

    file { 'vagrant-nginx-enable':
        path => '/etc/nginx/sites-enabled/prueba',
        target => '/etc/nginx/sites-available/prueba',
        ensure => link,
        notify => Service['nginx'],
        require => [
            File['vagrant-nginx'],
            File['default-nginx-disable'],
        ],
    }

}