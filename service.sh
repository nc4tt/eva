#!/system/bin/sh
MODDIR=${0%/*}

# Wait until system is stable
sleep 20

. $MODDIR/common/state.sh

HIGH=$(get_state high_oc)
[ -z "$HIGH" ] && HIGH=OFF

# Persistent notification
cmd notification post -S bigtext \
  -t "eva dashboard" \
  "oc_status" "safe uberclock: ON | high uberclock: $HIGH | butlup ruard: ACTIVE"

# Reset bootloop counter after successful boot
sleep 60
rm -f /data/adb/bootloop_count
