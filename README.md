# Monitoring-Script
Overview
This script is designed to monitor system resources and generate a report on the disk, CPU, memory usage, and running processes. It will also send an email alert if any of the specified thresholds are breached, and save the collected data into a log file. The script is intended to be used as a cron job that runs every hour.

Features
Disk Usage Monitoring:

Reports the percentage of disk space used for each mounted partition.
Sends a warning email if the disk usage exceeds the specified threshold (default is 80%).
CPU Usage Monitoring:

Displays the current CPU usage as a percentage.
Memory Usage Monitoring:

Shows total, used, and free memory.
Running Processes Monitoring:

Displays the top 5 memory-consuming processes.
Report Generation:

Saves the collected information into a log file (e.g., system_monitor.log).
User Configurable Options:

Allows the user to specify the disk usage warning threshold (-t flag).
Allows the user to specify the output file name (-f flag).
Script Usage
To use this script, you can run it directly from the command line. You may also set it up as a cron job for automated hourly execution.

Example Command:
bash
Copy
Edit
./system_monitor.sh -t 85 -f system_monitor.log
-t: Set the disk usage warning threshold. The default is 80%.
-f: Set the name of the output file. The default file name is system_monitor.log.
Script Functionality
Disk Usage Monitoring: The check_disk function checks the disk usage of the root partition ("/"). If usage exceeds the specified threshold (default is 80%), a warning email is sent to kareemdiaahelal@gmail.com.

CPU Usage Monitoring: The check_cpu function retrieves the current CPU usage using the top command and displays it.

Memory Usage Monitoring: The check_memory function displays the total, used, and free memory using the free command.

Running Processes Monitoring: The running_process function displays the top 5 processes consuming the most memory using the ps command.

Report Logging: The script logs the collected information into a log file (default: system_monitor.log), and the user can specify a different log file name using the -f flag.

Email Notification
If the disk usage exceeds the specified threshold (default 80%), an email is sent to the user (kareemdiaahelal@gmail.com) with the subject "Disk Usage Warning" and a message informing the user that disk usage has exceeded the threshold.

Cron Job Setup
To run the script every hour, you can set it up as a cron job. To do this, edit the crontab file by running:

bash
Copy
Edit
crontab -e
Then, add the following line to run the script every hour:

bash
Copy
Edit
0 * * * * /path/to/your/script/system_monitor.sh -t 80 -f /path/to/output.log
Make sure to replace /path/to/your/script/ and /path/to/output.log with the actual paths on your system.


![image](https://github.com/user-attachments/assets/ad52348d-7af3-4bc5-ac7e-3ddb60883b9c)
![image](https://github.com/user-attachments/assets/bb708b2f-cea3-4f41-8383-48d38b014bce)

Example Output
![image](https://github.com/user-attachments/assets/a4b8a774-2f4f-4f13-b936-f11942ffc8c1)
![image](https://github.com/user-attachments/assets/f04757d6-3906-407f-b5c9-e4e0cd002608)

