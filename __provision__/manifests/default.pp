exec { "apt-get update":
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
}

include system
include application
include nginx
include supervisor
