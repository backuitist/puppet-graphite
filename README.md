# Puppet module: graphite

This is a Puppet module for graphite based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Guillaume Lederrey

Official git repository: http://github.com/gehel/puppet-graphite

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install graphite with default settings

        class { 'graphite': }

* Install a specific version of graphite package

        class { 'graphite':
          version => '1.0.1',
        }

* Disable graphite service.

        class { 'graphite':
          disable => true
        }

* Remove graphite package

        class { 'graphite':
          absent => true
        }

* Enable auditing without without making changes on existing graphite configuration *files*

        class { 'graphite':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'graphite':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'graphite':
          source => [ "puppet:///modules/example42/graphite/graphite.conf-${hostname}" , "puppet:///modules/example42/graphite/graphite.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'graphite':
          source_dir       => 'puppet:///modules/example42/graphite/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'graphite':
          template => 'example42/graphite/graphite.conf.erb',
        }

* Automatically include a custom subclass

        class { 'graphite':
          my_class => 'example42::my_graphite',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'graphite':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'graphite':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'graphite':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'graphite':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/gehel/puppet-graphite.png?branch=master" alt="Build Status" />}[https://travis-ci.org/gehel/puppet-graphite]
