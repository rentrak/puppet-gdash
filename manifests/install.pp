# Class: gdash::install
#
class gdash::install {
  package { 'rubygem-bundler':
    ensure => present,
  }

  package { 'gdash':
    ensure => present,
  }

  package { 'gdash-bundled-deps':
    ensure => '0.98.14-1',
  }

  #package { 'rubygem-tilt':
  #  ensure => present
  #}

  #package { 'rubygem-rack':
  #  ensure => '1.3.4-1'
  #}

  #package { 'rubygem-rack-protection':
  #  ensure  => present,
  #  require => Package['rubygem-rack']
  #}

  #package { 'rubygem-sinatra':
  #  ensure  => '1.3.3-1',
  #  require => Package['rubygem-rack']
  #}
}

