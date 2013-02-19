# Class: gdash::config
#
class gdash::config {
  $documentroot      = $::gdash::documentroot
  $service_name      = $::gdash::service_name
  $vhost_config_file = $::gdash::vhost_config_file

  file { $documentroot:
    ensure => directory,
  }

  file { "${documentroot}/config/gdash.yaml":
    content => template('gdash/gdash.yaml.erb'),
    group   => '0',
    owner   => '0',
    require => Package['gdash'],
  }

  file { $vhost_config_file:
    ensure => 'file',
    mode   => '0644',
    group  => '0',
    owner  => '0',
    content => template('gdash/apache2_gdash.conf.erb'),
    notify => Service[$service_name];
  }
}
