#!/bin/sh
cd /sys/devices/platform/windfarm.0

cpu12vCurrent_0=$(cat cpu-12v-current-0)
cpu12vCurrent_1=$(cat cpu-12v-current-1)
cpuCoreCurrent_0=$(cat cpu-current-0)
cpuCoreCurrent_1=$(cat cpu-current-1)
cpuCoreVoltage_0=$(cat cpu-voltage-0)
cpuCoreVoltage_1=$(cat cpu-voltage-1)

equation="(($cpu12vCurrent_0 + $cpu12vCurrent_1) * 12) + ($cpuCoreCurrent_0 * $cpuCoreVoltage_0) + ($cpuCoreCurrent_1 * $cpuCoreVoltage_1)"
printf "Your PowerMac G5's CPUs are currently drawing: "
echo "$equation" | bc | tr -d '\n'
echo "W"

echo "Calculated using the following equation: $equation"
