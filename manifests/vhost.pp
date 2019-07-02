# Defione: caddy::vhost
# ===========================
#
# Setup caddy vhost in /etc/caddy/config/
#
# Examples:
# ---------
#
# caddy::vhost {'example1':
#   source => 'puppet:///modules/caddy/etc/caddy/config/example1.conf',
# }
#
#

define caddy::vhost(
  $source  = undef,
  $content = undef,
  $mode    = '0600',
  $owner   = $::caddy::caddy_user,
  $group   = $::caddy::caddy_group,
) {


  file { "/etc/caddy/config/${title}.conf":
    ensure  => file,
    content => $content,
    source  => $source,
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    require => Class['caddy::config'],
    notify  => Class['caddy::service'],
  }
}
