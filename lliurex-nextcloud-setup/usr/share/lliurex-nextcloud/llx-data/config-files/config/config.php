<?php
$CONFIG = array (
  'updatechecker' => false,
  'instanceid' => 'oc43y0z7c3pt',
  'passwordsalt' => 'SHj5zMDyzW3o3DX+zJzjIEzlPLJkhf',
  'secret' => 'hcwlx70NYkTKuPfzTYfcTzPG91sZxdAvoQK5c9PwoDjGiOsG',
  'trusted_domains' => 
  array (
    0 => 'server',
    1 => '{{ SRV_IP }}',
    2 => 'nextcloud',
    3 => '{{ EXTERNAL_IP }}',
  ),
  'datadirectory' => '/var/www/nextcloud/data',
  'dbtype' => 'mysql',
  'version' => '21.0.1.1',
  'overwrite.cli.url' => 'http://{{ SRV_IP }}/nextcloud',
  'dbname' => '{{ DB_NAME }}',
  'dbhost' => 'localhost',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => '{{ DB_USER }}',
  'dbpassword' => '{{ DB_PWD }}',
  'installed' => true,
  'ldapIgnoreNamingRules' => false,
  'ldapProviderFactory' => 'OCA\\User_LDAP\\LDAPProviderFactory',
  'forcessl' => true,
  'default_language' => '{{ DEFAULT_LOCALE }}', 
  'default_locale'=>'es_ES',
  'default_phone_region' => 'ES',

);
