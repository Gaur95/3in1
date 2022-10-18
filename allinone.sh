#!/bin/bash


/usr/sbin/apache2ctl -D FOREGROUND

/usr/sbin/sshd -D

wait -n

exit $?
