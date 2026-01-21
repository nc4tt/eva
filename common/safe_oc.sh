for cpu in /sys/devices/system/cpu/cpu*/cpufreq; do
  echo performance > $cpu/scaling_governor
done
