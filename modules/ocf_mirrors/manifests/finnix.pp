class ocf_mirrors::finnix {
  file {
    default:
      owner => mirrors,
      group => mirrors;

    '/opt/mirrors/project/finnix':
      ensure  => directory,
      mode    => '0755';

    '/opt/mirrors/project/finnix/sync-releases':
      source  => 'puppet:///modules/ocf_mirrors/project/finnix/sync-releases',
      mode    => '0755';

    # we are registered with the Finnix project and have a password for the
    # master upstream mirror
    '/opt/mirrors/project/finnix/password':
      source    => 'puppet:///private/mirrors/finnix',
      mode      => '0600',
      show_diff => false;
  }

  cron { 'finnix':
    command => '/opt/mirrors/project/finnix/sync-releases > /dev/null',
    user    => 'mirrors',
    minute  => '41';
  }
}
