class php {

  # package install list
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "php5-curl",
    "php-apc",
    "php5-intl",
    "libapache2-mod-php5"
  ]

  exec { 'apt-upgrade':
    command => "/usr/bin/apt-get --quiet --yes --fix-broken upgrade",
    logoutput => "on_failure",
    path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin:/sbin"
  }
  
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}

