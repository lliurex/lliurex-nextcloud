#!/bin/bash

cp ../install-files/usr/sbin/lliurex-nextcloud-setup /tmp/lliurex-nextcloud.py

xgettext ../install-files/usr/share/lliurex-nextcloud/rsrc/lliurex-nextcloud-setup.glade /tmp/lliurex-nextcloud.py -o lliurex-nextcloud/lliurex-nextcloud.pot

