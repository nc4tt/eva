#!/system/bin/sh
MODDIR=${0%/*}

. $MODDIR/common/info.sh
. $MODDIR/common/state.sh
. $MODDIR/common/eva.sh

CHOICE=1

# Display menu
ui_print "===================================="
ui_print "        eva controller    "
ui_print "===================================="
ui_print "Model   : $MODEL"
ui_print "SoC     : $SOC"
ui_print "RAM     : $RAM"
ui_print "Storage : $STORAGE"
ui_print "Kernel  : $KERNEL"
ui_print "Serial  : $SERIAL"
ui_print "------------------------------------"
ui_print "[1] high overclock (DANGER)"
ui_print "[2] safe mode"
ui_print "[3] "who fire!" (Gaming)"
ui_print "[4] feww use normal pweasee (Balanced)"
ui_print "[5] live slow pls sar (Battery Save)"
ui_print "------------------------------------"
ui_print "Vol+ : Move Down | Vol- : Move Up | Power : Select"
ui_print "===================================="

# Wait for key input
while true; do
  KEY=$(/system/bin/getevent -qlc 1)
  
  echo "$KEY" | grep -q "KEY_VOLUMEUP" && CHOICE=$((CHOICE+1))
  echo "$KEY" | grep -q "KEY_VOLUMEDOWN" && CHOICE=$((CHOICE-1))
  [ "$CHOICE" -lt 1 ] && CHOICE=1
  [ "$CHOICE" -gt 5 ] && CHOICE=5

  case $CHOICE in
    1) ui_print ">> high overclock (DANGER)";;
    2) ui_print ">> safe mode";;
    3) ui_print ">> "who fire!" (Gaming)";;
    4) ui_print ">> balanced";;
    5) ui_print ">> battery saver";;
  esac

  echo "$KEY" | grep -q "KEY_POWER" && break
done

# Apply selection
case $CHOICE in
  1)
    . $MODDIR/common/high_oc.sh
    set_state high_oc ON
    ;;
  2)
    set_state high_oc OFF
    ;;
  3)
    apply_gaming
    ;;
  4)
    apply_balanced
    ;;
  5)
    apply_battery
    ;;
esac
