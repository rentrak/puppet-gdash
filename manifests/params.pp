# Class: gdash::params
#
class gdash::params {
  $graphitehost      = '127.0.0.1'
  $gdashroot         = '/usr/local/gdash'
  $vhost_config_file = "${gdashroot}/gdash.conf"

  case $::osfamily {
    'Debian': {
      $service_name = 'apache2'
    }

    'RedHat': {
      $service_name = 'httpd'
    }

    default: {
      fail 'Operating system not supported.'
    }
  }
}

