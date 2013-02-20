# Class: gdash
#
class gdash (
  $graphite_host     = $::gdash::params::graphite_host,
  $log_dir           = $::gdash::params::log_dir,
  $package_deps      = $::gdash::params::package_deps,
  $package_ensure    = $::gdash::params::package_ensure,
  $package_name      = $::gdash::params::package_name,
  $service_name      = $::gdash::params::service_name,
  $template_dir      = $::gdash::params::template_dir,
  $vhost_config_file = $::gdash::params::vhost_config_file,
  $vhost_dir         = $::gdash::params::vhost_dir,
  $whisper_dir       = $::gdash::params::whisper_dir,
) inherits gdash::params {
  class { 'gdash::install': } ->
  class { 'gdash::config': } ->
  Class [ 'gdash' ]
}

