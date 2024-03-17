#! /system/bin/sh
cmd="$1"

function thp_enable() {
    if [ ! -f "/proc/cont_pte_hugepage/stat" ]; then
        echo always > /sys/kernel/mm/transparent_hugepage/enabled
    fi
}

function thp_disable() {
    if [ ! -f "/proc/cont_pte_hugepage/stat" ]; then
        echo never > /sys/kernel/mm/transparent_hugepage/enabled
    fi
}

function random_read_cpuset() {
   if [ -f /dev/cpuset/top-app/cpus ]; then
       echo 6-7 > /dev/cpuset/top-app/cpus
   fi
}

function random_write_cpuset() {
   if [ -f /dev/cpuset/top-app/cpus ]; then
       echo 6-7 > /dev/cpuset/top-app/cpus
   fi
}

function default_cpuset() {
   if [ -f /dev/cpuset/top-app/cpus ]; then
       echo 0-7 > /dev/cpuset/top-app/cpus
   fi
}

case "$cmd" in
    "thp_enable")
        thp_enable
        ;;
    "thp_disable")
        thp_disable
        ;;
    "random_read_cpuset")
        random_read_cpuset
        ;;
    "random_write_cpuset")
        random_write_cpuset
        ;;
    "default_cpuset")
        default_cpuset
        ;;
    *)
        ;;
esac
