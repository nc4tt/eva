STATE=/data/adb/oc_state
mkdir -p $STATE

set_state() { echo "$2" > $STATE/$1; }
get_state() { cat $STATE/$1 2>/dev/null; }
