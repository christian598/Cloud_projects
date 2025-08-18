### Manage users and groups

## Create group
sudo groupadd bioinf

## Add user to group
sudo usermod -aG bioinf ubuntu

## Set permision on volume/filesystem
sudo chown root:bioinf /mnt/extra-volume
sudo chmod 770 /mnt/extra-volume

## See groups
groups