class ocf_desktop::inventory {
  user {
    'ocfinventory':
      comment => 'OCF Desktop Hardware Inventory',
      home    => '/opt/stats',
      system  => true,
      groups  => 'sys';
  }

  file {
    '/opt/inventory/':
      ensure => directory,
      mode   => '0755';

    '/opt/inventory/report_desktop_hardware':
      mode   => '0555',
      source => 'puppet:///modules/ocf_desktop/report_desktop_hardware';
  }

  cron { 'hardwarestats':
    ensure   => present,
    command  => '/opt/inventory/report_desktop_hardware > /dev/null',
    user     => 'ocfinventory',
    special  => 'hourly'
  }
}
