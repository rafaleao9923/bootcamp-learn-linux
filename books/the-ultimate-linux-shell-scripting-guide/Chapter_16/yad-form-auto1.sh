#!/bin/bash

yad --title="Classic Autos" --text="Enter the info about your classic auto:" \
	--form --width=400 \
	--field="Year":NUM \
	--field="Make" \
	--field="Model" \
	--field="Body Style" >> classic_autos.txt
