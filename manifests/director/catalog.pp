define bacula::director::catalog (
  $name = $title,
  $db_driver = 'dbi:mysql',
  $db_address = 'localhost',
  $db_port = '',
  $db_name = '',
  $db_user = '',
  $db_password = '',
  $template = "templates/catalog.conf.erb"
) {

  include bacula

  file { "catalog-${name}.conf":
    ensure  => $bacula::manage_file,
    path    => "${catalog_configs_dir}/catalog-${name}.conf",
    mode    => $bacula::config_file_mode,
    owner   => $bacula::config_file_owner,
    group   => $bacula::config_file_group,
    require => Package[$bacula::director_package],
    notify  => $bacula::manage_service_autorestart,
    content => $template,
    replace => $bacula::manage_file_replace,
    audit   => $bacula::manage_audit,
  }


}
