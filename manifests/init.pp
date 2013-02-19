# Class: gdash
#
class gdash (
  $gdashroot         = $::gdash::params::gdashroot,
  $graphitehost      = $::gdash::params::graphitehost,
  $service_name      = $::gdash::params::service_name,
  $vhost_config_file = $::gdash::params::vhost_config_file,
) inherits gdash::params {
  class { 'gdash::install': } ->
  class { 'gdash::config': } ->
  Class [ 'gdash' ]
}

