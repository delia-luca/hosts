#!/bin/bash

verifica_ip() {
	nume=$1
	ip=$2
	server=$3
	nslookup "$nume" "$server" | grep "Address: $ip" > /dev/null
}

cat /etc/hosts | while read ip nume rest
do
	case "$ip" in
		""|"#"*) ;;
		*)
			if verifica_ip "$nume" "$ip" 8.8.8.8 
			then
				echo "OK: $nume"
			else
				echo "Bogus IP for $nume in /etc/hosts!"
			fi
			;;
	esac
done
