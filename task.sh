#!/bin/bash

# 1.Check disk
check_disk() {
  disk_usage=$(df -h | awk '$NF=="/" {print $5}' | tr -d '%')

if [[ "$disk_usage" -ge 80 ]];
then
    echo "WARNING: Disk usage is above 80%"
    echo "Warning: Disk usage exceeded 80%. Please take proper actions." | \
      mail -s "Disk Usage Warning" -a "From: Monitor System" kareemdiaahelal@gmail.com 
  fi
  echo "Disk Usage: $disk_usage%"
}

# 2.Check CPU
check_cpu() {
  cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{printf "%.2f\n", 100 - $8}')
  echo "CPU usage is: $cpu_usage%"
}

# 3.Function to check memory usage
check_memory() {
  mem_usage=$(free -h | awk 'NR==2 {printf "Total: %s, Used: %s, Free: %s", $2, $3, $4}')
  echo "Memory Usage is: $mem_usage%"
}

# 4.Check top 5 running processes
running_process() {
  running_processes=$(ps -eo pid,user,%mem,comm | sort -nrk 3,3 | head -n 5)
  echo "Top 5 Running processes are:"
  echo "$running_processes"
}

echo "Disk Usage:"
check_disk

echo "Checking CPU Usage:"
check_cpu

echo "Memory Usage:"
check_memory

echo "Top 5 Processes Running:"
running_process
