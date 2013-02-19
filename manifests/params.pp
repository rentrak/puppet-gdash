# Class: gdash::params
#
class gdash::params {
  $graphitehost      = '127.0.0.1'
  $gdashroot         = '/usr/local/gdash'
  $vhost_config_file = "${gdashroot}/gdash.conf"

  case $::osfamily {
    'Debian': {
      $package_deps   = undef
      $package_ensure = true
      $package_name   = undef
      $service_name   = 'apache2'
    }


    'RedHat': {
      $package_deps   = [ 'rubygem-bundler', 'gdash-bundled-deps' ]
      $package_ensure = true
      $package_name   = [ 'gdash' ]
      $service_name   = 'httpd'
    }

    default: {
      fail 'Operating system not supported.'
    }
  }
}

