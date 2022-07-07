#!/bin/bash

# chmod files
# finds files which are not 664 permission and fixes them
find /media/movies        -type f \! -perm 664 -exec chmod 664 {} \; -print
find /media/tv            -type f \! -perm 664 -exec chmod 664 {} \; -print

# chmod directories
# finds directories which are not 777 and fixes them
find /media/movies        -type d \! -perm 775 -exec chmod 775 {} \; -print
find /media/tv            -type d \! -perm 775 -exec chmod 775 {} \; -print

# chown everything
# finds anything not owned by plex and fixes them
find /media/movies        \! -user plex -exec chown plex.plex {} \; -print
find /media/tv            \! -user plex -exec chown plex.plex {} \; -print