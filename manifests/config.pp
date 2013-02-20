# Class: gdash::config
#
class gdash::config {
  $config_dir        = $::gdash::config_dir
  $config_group      = $::gdash::config_group
  $config_user       = $::gdash::config_user
  $package_name      = $::gdash::package_name
  $service_name      = $::gdash::service_name
  $template_dir      = $::gdash::template_dir
  $vhost_config_file = $::gdash::vhost_config_file
  $vhost_dir         = $::gdash::vhost_dir
  $vhost_group       = $::gdash::vhost_group
  $vhost_user        = $::gdash::vhost_user

  file { $config_dir:
    ensure => directory,
    owner  => $config_user,
    group  => $config_group,
  }

  file { "${vhost_dir}/public":
    ensure => directory,
    owner  => $vhost_user,
    group  => $vhost_group,
  }

  file { $template_dir:
    ensure => directory,
    owner  => $vhost_user,
    group  => $vhost_group,
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
