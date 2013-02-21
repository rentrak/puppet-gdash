# Class: gdash::params
#
class gdash::params {
  $config_group      = 'root'
  $config_user       = 'root'
  $graphite_host     = "http://graphite.${::domain}"
  $vhost_serveralias = undef
  $vhost_servername  = "gdash.${::domain}"

  case $::osfamily {
    'Debian': {
      $config_dir        = '/usr/share/gdash'
      $log_dir           = '/var/log/apache2'
      $package_deps      = undef
      $package_ensure    = true
      $package_name      = 'graphite-gdash'
      $service_name      = 'apache2'
      $template_dir      = "${config_dir}/graph_templates"
      $vhost_config_file = "${config_dir}/apache2_gdash.conf"
      $vhost_dir         = '/usr/share/gdash'
      $vhost_group       = 'www-data'
      $vhost_user        = 'www-data'
      $whisper_dir       = '/opt/graphite/storage/whisper'
    }

    'RedHat': {
      $config_dir        = '/usr/local/gdash'
      $log_dir           = '/var/log/httpd'
      $package_deps      = [ 'rubygem-bundler', 'gdash-bundled-deps' ]
      $package_ensure    = true
      $package_name      = [ 'gdash' ]
      $service_name      = 'httpd'
      $template_dir      = "${config_dir}/graph_templates"
      $vhost_config_file = "${config_dir}/apache2_gdash.conf"
      $vhost_dir         = '/usr/local/gdash'
      $vhost_group       = 'apache'
      $vhost_user        = 'apache'
      $whisper_dir       = '/var/lib/carbon/whisper'
    }

    default: {
      fail 'Operating system not supported.'
    }
  }
}

