# Class: gdash::install
#
class gdash::install {
  $package_deps   = $::gdash::package_deps
  $package_ensure = $::gdash::package_ensure
  $package_name   = $::gdash::package_name

  if $package_deps {
    package { $package_deps:
      ensure => $package_ensure,
    }
  }

  package { $package_name:
    ensure => present,
  }
}

