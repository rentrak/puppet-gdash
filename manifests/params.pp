# Class: gdash::params
#
class gdash::params {
  $graphite_host     = '127.0.0.1'
  $vhost_servername  = "gdash.${domain}"
  $vhost_serveralias = undef

  case $::osfamily {
    'Debian': {
      $config_dir        = '/usr/share/gdash'
      $log_dir           = '/var/log/apache2'
      $package_deps      = undef
      $package_ensure    = true
      $package_name      = 'graphite-gdash'
      $service_name      = 'apache2'
      $vhost_config_file = "${config_dir}/apache2_gdash.conf"
      $vhost_dir         = '/usr/share/gdash'
      $whisper_dir       = '/opt/graphite/storage/whisper'
    }

    'RedHat': {
      $config_dir        = '/usr/local/gdash'
      $log_dir           = '/var/log/httpd'
      $package_deps      = [ 'rubygem-bundler', 'gdash-bundled-deps' ]
      $package_ensure    = true
      $package_name      = [ 'gdash' ]
      $service_name      = 'httpd'
      $vhost_config_file = "${config_dir}/apache2_gdash.conf"
      $vhost_dir         = '/usr/local/gdash'
      $whisper_dir       = '/var/lib/carbon/whisper'
    }

    default: {
      fail 'Operating system not supported.'
    }
  }
}

