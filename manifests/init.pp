# Defined Type: ie_esc
define ie_esc (
  $ensure = UNDEF,
  $users = UNDEF,
  $administrators = UNDEF,
){
  $key_loc = 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components'
  case $ensure {
    'present' : {
      $esc_user_data = $users ? {
        'off'   => 0,
        default => 1,
      }
      $esc_admin_data = $administrators ? {
        'off'   => 0,
        default => 1,
      }
    }
    'absent'  : {
      $esc_admin_data = 0
      $esc_user_data = 0
    }
    default   : { fail('You must specify ensure status...') }
  }

  registry::value { 'IE ESC for Administrators' :
    key   => "${key_loc}\\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}",
    value => 'IsInstalled',
    type  => dword,
    data  => $esc_admin_data,
  }

    registry::value { 'IE ESC for Users' :
    key   => "${key_loc}\\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}",
    value => 'IsInstalled',
    type  => dword,
    data  => $esc_user_data,
  }
}
