#!/usr/bin/env zsh

COLOR_HIGH=0xffed2985
COLOR_MID=0xff0ad2ff
COLOR_LOW=0xff3cfa50

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

CPU_ALL=$((CPU_SYS+CPU_USER*100))

VALUE=$(printf "%0.2f\n" $CPU_ALL)
VALUE_INT=${VALUE%.*}
VALUE_FORMATTED=$VALUE_INT
VALUE_DECIMALS=${#VALUE_INT}

if [ "$VALUE_DECIMALS" -eq "1" ]; then
  VALUE_FORMATTED="0$VALUE_INT"
fi

sketchybar -m --set usage.cpu.value label=$VALUE_FORMATTED%

if [ "$VALUE_INT" -ge "75" ]; then
  sketchybar -m --set usage.cpu.value label.color=$COLOR_HIGH
elif [ "$VALUE_INT" -ge "50" ]; then
  sketchybar -m --set usage.cpu.value label.color=$COLOR_MID
else
  sketchybar -m --set usage.cpu.value label.color=$COLOR_LOW
fi
