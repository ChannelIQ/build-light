#! /bin/sh

### BEGIN INIT INFO
# Provides:          build-light
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Simple script to start a program at boot
# Description:       A simple script from www.stuffaboutcode.com which will start / stop a program a boot / shutdown.
### END INIT INFO


case "$1" in
  start)
    cd /home/pi/build-light
    sudo python build_light.py &
    ;;
  stop)
    killall python
    ;;
  restart)
    killall python
    cd /home/pi/build-light
    sudo python build_light.py &
    ;;
  *)
    echo "usage: stop|start|restart"
    exit 1
esac

exit 0
