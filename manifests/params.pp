# Class: gdash::params
#
class gdash::params {
  $documentroot      = '/usr/local/gdash'
  $graphitehost      = '127.0.0.1'
  $vhost_config_file = "${documentroot}/gdash.conf"

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

