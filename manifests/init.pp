# Class: gdash
#
class gdash (
  $graphitehost      = $::gdash::params::graphitehost,
  $log_dir           = $::gdash::params::log_dir,
  $package_deps      = $::gdash::params::package_deps,
  $package_ensure    = $::gdash::params::package_ensure,
  $package_name      = $::gdash::params::package_name,
  $service_name      = $::gdash::params::service_name,
  $service_name      = $::gdash::params::service_name,
  $vhost_config_file = $::gdash::params::vhost_config_file,
  $vhost_dir         = $::gdash::params::vhost_dir,
) inherits gdash::params {
  class { 'gdash::install': } ->
  class { 'gdash::config': } ->
  Class [ 'gdash' ]
}

