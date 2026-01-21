COUNT_FILE=/data/adb/bootloop_count
MAX=5

[ ! -f $COUNT_FILE ] && echo 0 > $COUNT_FILE
COUNT=$(cat $COUNT_FILE)
COUNT=$((COUNT+1))
echo $COUNT > $COUNT_FILE

if [ "$COUNT" -ge "$MAX" ]; then
  rm -rf /data/adb/modules/*
  rm -f $COUNT_FILE
  reboot
fi
