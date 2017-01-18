#!/bin/sh            
SCREENSHOT_DIR="$HOME/.screenshot"

if [ ! -x ${SCREENSHOT_DIR} ]; then mkdir -p ${SCREENSHOT_DIR}; fi

SCREENSHOT_NAME=`hostname`"_"`date +%Y%m%d_%H%M%S.png`

if pgrep -x "compton" > /dev/null
then
    OPENGL="--opengl"
fi

maim -s --showcursor -b 1 ${OPENGL} ${SCREENSHOT_DIR}/${SCREENSHOT_NAME}
notify-send "Screenshot ${SCREENSHOT_NAME} uložen do ${SCREENSHOT_DIR}."
