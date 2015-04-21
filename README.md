# ie_esc #
## Internet Explorer Enhanced Security Configuration

This module allows you to manage the configuration of IE ESC on Windows 2008 and 2012 servers.



## Dependencies ##

see Modulefile

## Sample Usage ##

**Enable IE ESC for Users and Administrators**

	ie_esc {"IE ESC Configuration": ensure => present }

**Disable IE ESC for Users and Administrators**

	ie_esc {"IE ESC Configuration": ensure => absent }

**Enable IE ESC for Users / Disable IE ESC for Administrators**

	ie_esc {"IE ESC Configuration":
	  ensure => present,
      users => on,
      administrators => off,
    }

**Enable IE ESC for Administrators / Disable IE ESC for Users**

	ie_esc {"IE ESC Configuration":
	  ensure => present,
      users => off,
      administrators => on,
    }