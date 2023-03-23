# Create script, that generates report file with following information:

#     - current date and time;
echo "Current time and date is: $(date)"
#     - name of current user;
echo "Current user name is: ${USER}"
#     - internal IP address and hostname;
echo "Internal IP address is $(ip -o -f inet a | grep global | awk '{print $4}') with the hostname of $(cat /etc/hostname)"
#     - external IP address;
echo "External IP address is $(curl -s ip.me)"
#     - name and version of Linux distribution;
echo "The system is running $(cat /etc/os-release | grep PRETTY_NAME | sed 's/PRETTY_NAME=//g' | sed 's/"//g')"
#     - system uptime;
echo "Uptime in seconds: $(cat /proc/uptime | awk '{print $1}')"
#     - information about used and free space in / in GB;
echo "Storage info: $(df -hl / | awk 'NR>=2 {print "Total size " $2 ", Used " $3 ", Available " $4}')"
#     - information about total and free RAM;
echo "Ram information: $(free)"
#     - number and frequency of CPU cores
echo "The system has $(cat /proc/cpuinfo | grep processor | wc -l) cores running at $(cat /proc/cpuinfo | grep MHz | awk 'NR<=1 {print "scale=2; " $4 " / 1024"}' | bc)"
