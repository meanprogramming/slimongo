class mysql {

  # root mysql password
  $mysqlpw = "vagrant"

  # install mysql server
  package { "mysql-server":
    ensure => present,
    require => Exec["apt-get update"]
  }

  #start mysql service
  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }
  
  # install MySQL configuration file 
  #file { '/etc/mysql/my.cnf':
  #  source => 'puppet:///modules/mysql/my.cnf',
  #  require => Package['mysql-server'],
  #  notify => Service['mysql'];
  #}

  # set mysql password
  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlpw status",
    command => "mysqladmin -uroot password $mysqlpw",
    require => Service["mysql"],
  }
}
