#!/sbin/sh
#####
# This file is part of the Injector Project: https://github.com/spazedog/injector
#  
# Copyright (c) 2013 Daniel Bergløv
#
# Injector is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Injector is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Injector. If not, see <http://www.gnu.org/licenses/>
#####

## Samsung Galaxy S

case "$1" in 
    write)
        if $CONFIG_BUSYBOX [ -e /dev/block/bml7 ]; then
            if flash_image boot $CONFIG_FILE_BOOTIMG 2>/dev/null || ( $CONFIG_BUSYBOX test -e /sbin/flash_image && /sbin/flash_image boot $CONFIG_FILE_BOOTIMG ); then
                exit 0
            fi

        else
            if bml_over_mtd.sh boot 72 reservoir 2004 $CONFIG_FILE_BOOTIMG; then
                exit 0
            fi
        fi
    ;;
esac

exit 1
