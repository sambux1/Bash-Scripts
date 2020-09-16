#!/bin/bash

# aliased to 'battery'

# example output:
#
# Power consumption: 34 W
# Energy remaining: 18 Wh (28%)


# get the current power consumption in Watts
power=$(cat /sys/class/power_supply/BAT0/power_now)
power_w=$(($power / 1000000))

# get the current energy remaining in the battery in Watt hours
energy=$(cat /sys/class/power_supply/BAT0/energy_now)
energy_wh=$(($energy / 1000000))

# calculate the percentage of battery capacity remaining
capacity=$(cat /sys/class/power_supply/BAT0/energy_full)
percentage=$(($energy * 100 / $capacity))

echo Power consumption: $power_w W
echo "Energy remaining: $energy_wh Wh (${percentage}%)"

