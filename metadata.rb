name             'rsc_docker'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc_docker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "docker"
depends "marker"

recipe "docker::default", "docker default"
