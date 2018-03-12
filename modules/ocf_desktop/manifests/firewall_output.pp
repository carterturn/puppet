# allow desktops to send packets to papercut, pagefault, radiation
class ocf_desktop::firewall_output {
  include ocf::firewall::output_printers

  ocf::firewall::firewall46 { '899 allow desktop output':
    opts => {
      chain       => 'PUPPET-OUTPUT',
      action      => 'accept',
      destination => ['radiation'],
    },
  }
}
