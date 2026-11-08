#!/bin/bash

cat /etc/hosts | while read ip nume rest
do
	case "$ip" in
		""|"#"*) ;;
		*)
			if nslookup "$nume" 8.8.8.8 | grep "Address: $ip" > /dev/null
			then
				echo "OK: $nume"
			else
				echo "Bogus IP for $nume in /etc/hosts!"
			fi
			;;
	esac
done
