### Mount Volume / filesystem in EC2

# List Disks
lsblk

# Format disk if it is new
sudo mkfs -t ext4 /dev/xvdf
(ext4 common filesystem)

# Mount formatted filesystem to a given folder
sudo mkdir /mnt/data               (/mnt/ folder often used for external mounted drives)
sudo mount /dev/xvdf /mnt/data     (/dev/ devices folder)

# When linux system is shutoff, the filesystem gets unmounted from the /mnt/data/ folder.
# If you want it always mounted to the given folder.

sudo blkid /dev/xvdf
sudo nano /etc/fstab
# Add the following line in the file.
/dev/xvdf   /mnt/data   ext4   defaults,nofail   0   2

