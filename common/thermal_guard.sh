TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
if [ "$TEMP" -gt 65000 ]; then
  for cpu in /sys/devices/system/cpu/cpu*/cpufreq; do
    echo 1200000 > $cpu/scaling_max_freq
  done
fi
