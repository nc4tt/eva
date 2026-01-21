#!/system/bin/sh
# Early boot tweaks
MODDIR=${0%/*}

# Bootloop protection
. $MODDIR/common/bootloop_guard.sh

# Apply safe overclock
. $MODDIR/common/safe_oc.sh

# RAM & GPU tweaks
. $MODDIR/common/ram_gpu_tweaks.sh

# Thermal guard (optional early)
. $MODDIR/common/thermal_guard.sh
