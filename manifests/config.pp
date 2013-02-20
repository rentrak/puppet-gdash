# Class: gdash::config
#
class gdash::config {
  $package_name      = $::gdash::package_name
  $service_name      = $::gdash::service_name
  $vhost_config_file = $::gdash::vhost_config_file
  $vhost_dir         = $::gdash::vhost_dir

  file { $vhost_dir:
    ensure => directory,
  }

  file { "${vhost_dir}/config":
    ensure => directory,
  }

  file { "${vhost_dir}/config/gdash.yaml":
    content => template('gdash/gdash.yaml.erb'),
    group   => '0',
    owner   => '0',
    require => Package[$package_name],
    notify  => Service[$service_name],
  }

  file { $vhost_config_file:
    ensure  => 'file',
    mode    => '0644',
    group   => '0',
    owner   => '0',
    content => template('gdash/apache2_gdash.conf.erb'),
    notify  => Service[$service_name];
  }
}
