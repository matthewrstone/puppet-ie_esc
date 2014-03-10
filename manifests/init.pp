# Class: ie_esc
#
# This module manages ie_esc
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
define ie_esc(
  $ensure = UNDEF,
  $users = UNDEF,
  $administrators = UNDEF,
){
  
  case $ensure {
    'present': { 
      case $users {
        UNDEF,'on': { $esc_user_data = 1 }
        'off': { $esc_user_data = 0 }
        default: { $esc_user_data = 1 }
      }
      case $administrators {
        UNDEF,'on': { $esc_admin_data = 1 }
        'off': { $esc_admin_data = 0 }
        default: { $esc_admin_data = 1 }
      }    
    }
    'absent': { 
      $esc_admin_data = 0
      $esc_user_data = 0
    }
    default: { fail('You must specify ensure status...') }  
  }
  registry::value{'IE ESC for Administrators':
    key    => 'hklm\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}',
    value  => 'IsInstalled',
    type   => dword,
    data   => $esc_admin_data,
  }
    registry::value {'IE ESC for Users':
    key    => 'hklm\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}',
    value  => 'IsInstalled',
    type   => dword,
    data   => $esc_user_data,
  }
}
