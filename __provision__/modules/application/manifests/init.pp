# Class: application
#
#
class application {
    package { 'postgresql-9.3':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    package { 'postgresql-contrib-9.3':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    package { 'libpq-dev':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    package { 'python3.4':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    package { 'python3.4-dev':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    package { 'rabbitmq-server':
        ensure => installed,
        require => Exec['apt-get update'],
    }

    exec { 'pip3 install -r requirements.txt':
        path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        cwd => '/vagrant/',
        require => Package['libpq-dev', 'python3.4-dev', 'postgresql-9.3', 'postgresql-contrib-9.3']
    }

    exec { 'database-user':
        command      => 'psql -c "CREATE USER master WITH PASSWORD \'m4st3r\';"',
        path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        user => 'postgres',
    }

    exec { 'database':
        command      => 'psql -c "CREATE DATABASE api OWNER master;"',
        path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
        user => 'postgres',
        require => Exec['database-user'],
    }
}
