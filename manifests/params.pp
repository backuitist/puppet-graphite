# Class: graphite::params
#
# This class defines default parameters used by the main module class graphite
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to graphite class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class graphite::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'graphite',
  }

  $service = $::operatingsystem ? {
    default => 'graphite',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'graphite',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'graphite',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/graphite',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/graphite/graphite.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/graphite',
    default                   => '/etc/sysconfig/graphite',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/graphite.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/graphite',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/graphite',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/graphite/graphite.log',
  }

  $port = '42'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
