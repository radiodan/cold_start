class network {
  package {'avahi-daemon': }
  package {'hostapd':
    ensure => installed,
  }

  service {'hostapd':
    ensure => stopped,
    enable => false,
    require => [Package["hostapd"], File["/etc/hostapd/hostapd.conf"]],
  }

  file { "/etc/hostapd/hostapd.conf":
    content => template("network/hostapd_conf"),
    require => Package["hostapd"],
  }

  file { "/etc/network/interfaces":
    content => template("network/interfaces"),
  }
  file { "/etc/rc.local":
    content => template("network/rc_local"),
    mode => '755',
  }
  file { "/usr/local/bin/try_adhoc_network":
    content => template("network/try_adhoc_network"),
    mode => '700',
  }

  package {'wpasupplicant': }

  file { "/etc/wpa_supplicant/wpa_supplicant.conf":
    content => template("network/wpa_supplicant_conf"),
    require => Package['wpasupplicant'],
  }

  # Enable copying of a wpa_supplicant config file from
  # boot partition on startup if newer than installed
  # config
  file { "/boot/wpa_supplicant.txt":
    content => template("network/wpa_supplicant_conf"),
  }

  file { "/etc/init/wpa-conf-copier.conf":
    content => template("network/wpa_conf_copier_upstart"),
    mode => 644,
  }

}
