for cpu in /sys/devices/system/cpu/cpu*/cpufreq; do
  echo 1 > $cpu/boost
  echo 9999999 > $cpu/scaling_max_freq
done

# GPU extreme
echo 1200000000 > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq 2>/dev/null
