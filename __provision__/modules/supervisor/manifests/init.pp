# Class: supervisor
#
#
class supervisor {

    package { 'supervisor':
        ensure => installed,
        require => Exec["apt-get update", "pip3 install -r requirements.txt"],
    }

    file { 'loggin':
        path => '/etc/supervisor/conf.d/prueba.conf',
        ensure => file,
        require => Package['supervisor'],
        source => 'puppet:///modules/supervisor/prueba.conf',
    }

    file { '/home/vagrant/logs':
        ensure => directory,
    }

    file { '/home/vagrant/logs/gunicorn_supervisor.log':
        ensure => file,
        require => File["/home/vagrant/logs"],
    }

    exec { 'reread':
        command      => 'sudo supervisorctl reread',
        path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        require => File['loggin'],
    }

    exec { 'update':
        command      => 'sudo supervisorctl update',
        path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        require => Exec['reread'],
    }

}
