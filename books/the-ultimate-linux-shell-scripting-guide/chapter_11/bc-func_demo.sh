#!/bin/bash
. /usr/local/lib/baseconv.lib
until [ "$choice" = "q" ]; do
	echo "Choose your desired function from the following list: "
	echo "For hex to decimal, press \"1\"."
	echo "For decimal to hex, press \"2\"."
	echo "For octal to hex, press \"3\"."
	echo "For hex to octal, press \"4\"."
	echo "To quit, press \"q\"."

	read choice
	case $choice in
		1) echo "Enter the hex number that you would like to convert. "
			read input_num
			h2d
			echo $h2dnum
			echo
			echo
			;;
		2) echo "Enter the decimal number that you would like to convert. "
 			read input_num
			d2h
			echo $d2hnum
			echo
			echo
			;;
		3) echo "Enter the octal number that you would like to convert. "
			read input_num
			o2h
			echo $o2hnum
			echo
			echo
			;;
		4) echo "Enter the hex number that you would like to convert. "
			read input_num
			h2o
			echo $h2onum
			echo
			echo
			;;
		q) exit
			;;
		*) echo "You did not enter a valid choice."
			echo
			echo
	esac
done

		

