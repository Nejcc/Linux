#!/bin/bash
echo "Setup the permission for Laravel project."
echo "Laravel base directory is $1"

echo ""
echo "Set owner to www-data"
chown -R www-data:www-data $1

echo ""
echo "Set all files to 644"
find $1 -type f -exec chmod 644 {} \; 

echo ""
echo "Set all direcotries to 755"
find $1 -type d -exec chmod 755 {} \; 

echo ""
echo "Correct the permission for the cache"
chgrp -R www-data $1/storage $1/bootstrap/cache
chmod -R ug+rwx $1/storage $1/bootstrap/cache

echo ""
echo "Setup finished"
