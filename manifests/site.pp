class common {
    # install Puppet on VM
    group { 'puppet': ensure => 'present' }

    # define Exec commands
    exec { 'apt-get update':
      command => '/usr/bin/apt-get -y update'
    }

    # install default packages
    $default_packages = ['tree','zip','unzip','subversion', 'git-core', 'bzr', 'vim',
             'wget','ant', 'python-setuptools', 'python-virtualenv', 'python-nose',
             'logtail', 'apache2', 'mysql-server', 'mysql-client',
             'libmysqlclient-dev', 'php5', 'php5-cli', 'php5-mysql']
    package { $default_packages:
      ensure => latest,
      require => Exec['apt-get update']
    }
}

class lamp {
    class apache {
        service { 'apache2':
          ensure => running,
          enable => true,
          require => Package['apache2']
        }
        package { "libapache2-mod-php5":
          ensure => latest,
          notify => Service['apache2']
        }
        package { 'libapache2-mod-wsgi':
          ensure => latest,
          notify => Service['apache2']
        }
        File {
          owner => 'root',
          group => 'root',
          mode => '0644'
        }
        file { '/var/www':
               ensure => link,
               target => '/vagrant/var/www',
               force => true
        }
    }
    class mysql {
        service { "mysql":
          ensure => running,
          enable => true,
          require => Package["mysql-server"],
        }
        exec { "set-mysql-password":
          unless  => "mysql -uroot -proot",
          path    => ["/bin", "/usr/bin"],
          command => "mysqladmin -uroot password root",
          require => Service["mysql"],
          notify => Service['apache2']
        }
    }
    include apache
    include mysql
}

include common
include lamp