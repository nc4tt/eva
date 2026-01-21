# zRAM
echo 1073741824 > /sys/block/zram0/disksize
mkswap /dev/block/zram0
swapon /dev/block/zram0

# GPU min freq
echo 300000000 > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq 2>/dev/null
