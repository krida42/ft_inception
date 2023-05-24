#!/bin/bash

#service php7.3-fpm start
service nginx start

echo 'cuicui = ' $CUICUI > cuicui.txt

tail -f /dev/null
