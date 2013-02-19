# Class: gdash
#
class gdash (
  $gdashroot         = $::gdash::params::gdashroot,
  $graphitehost      = $::gdash::params::graphitehost,
  $package_deps      = $::gdash::params::package_deps,
  $package_ensure    = $::gdash::params::package_ensure,
  $package_name      = $::gdash::params::package_name,
  $service_name      = $::gdash::params::service_name,
  $service_name      = $::gdash::params::service_name,
  $vhost_config_file = $::gdash::params::vhost_config_file,
) inherits gdash::params {
  class { 'gdash::install': } ->
  class { 'gdash::config': } ->
  Class [ 'gdash' ]
}

