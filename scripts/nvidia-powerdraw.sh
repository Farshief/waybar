#!/bin/bash

# Query power consumption and storage information
power_draw=$(nvidia-smi --query-gpu=power.draw --format=csv,nounits,noheader)
memory_info=$(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader)
util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,nounits,noheader)
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,nounits,noheader)

used_memory=$(echo "$memory_info" | awk -F ',' '{print $1}')
total_memory=$(echo "$memory_info" | awk -F ',' '{print $2}')

# Output for Waybar
echo "<span color='#5994ce'>${util}% <big></big></span> <span color='#ebce5f'>${temp}°C <big></big></span> <span color='#c76ce0'>${power_draw}W</span>"
echo "${used_memory} /${total_memory}"  # Tooltip
