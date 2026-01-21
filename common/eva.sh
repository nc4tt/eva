apply_balanced() {
  for cpu in /sys/devices/system/cpu/cpu*/cpufreq; do
    echo schedutil > $cpu/scaling_governor
  done
}

apply_gaming() {
  for cpu in /sys/devices/system/cpu/cpu*/cpufreq; do
    echo performance > $cpu/scaling_governor
  done
  echo 900000000 > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq 2>/dev/null
}

apply_battery() {
  for cpu in /sys/devices/system/cpu/cpu*/cpufreq; do
    echo powersave > $cpu/scaling_governor
  done
}
