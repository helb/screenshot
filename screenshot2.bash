#!/bin/bash
DISPLAY=":0"
SCREENSHOT_DIR="$HOME/.screenshot/"
SCREENSHOT_NAME=`hostname`"_"`date +%Y%m%d_%H%M%S.png`
SSH_USER="helb"
SSH_SERVER="helb.cz"
SSH_DIR="/home/helb/www/screen.helb.cz/htdocs/"
URL_PREFIX="http://screen.helb.cz/"
OPTIPNG_PARAMS="-i0 -o7"

if [ ! -x ${SCREENSHOT_DIR} ]; then mkdir -p ${SCREENSHOT_DIR}; fi

case $1 in
	f)
		#scrot ${SCREENSHOT_DIR}${SCREENSHOT_NAME}
		scrot ${SCREENSHOT_DIR}${SCREENSHOT_NAME}
		;;
	w)
		#scrot -b -s ${SCREENSHOT_DIR}${SCREENSHOT_NAME}
		import ${SCREENSHOT_DIR}${SCREENSHOT_NAME}
		;;
	*)
		echo "$0 w|f"
		exit 1
		;;
esac

scp -i /home/helb/.ssh/awsfree.pem ${SCREENSHOT_DIR}${SCREENSHOT_NAME} ec2-user@ec2-54-213-58-221.us-west-2.compute.amazonaws.com:../www/stuff/scr/
#URL=`immio ${SCREENSHOT_DIR}${SCREENSHOT_NAME}`
URL=http://stuff.helb.cz/scr/${SCREENSHOT_NAME}
echo -n ${URL} | xclip
#echo "${SCREENSHOT_NAME}  -> ${URL}" 
#echo -n "http://screen.helb.cz/${SCREENSHOT_NAME}" |/usr/bin/xclip
notify-send "OK, sreenshot ${SCREENSHOT_NAME} uložen na ${URL}."
