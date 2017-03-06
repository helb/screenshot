#!/bin/sh            
SCREENSHOT_DIR="$HOME/.local/screenshot"

if [ ! -x ${SCREENSHOT_DIR} ]; then mkdir -p ${SCREENSHOT_DIR}; fi

SCREENSHOT_NAME=`hostname`"_"`date +%Y%m%d_%H%M%S.png`

if pgrep -x "compton" > /dev/null
then
    OPENGL="-o"
fi

maim -s -b 1 ${OPENGL} ${SCREENSHOT_DIR}/${SCREENSHOT_NAME}
notify-send "Screenshot ${SCREENSHOT_NAME} uložen do ${SCREENSHOT_DIR}."
