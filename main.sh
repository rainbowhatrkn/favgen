#!/bin/bash

CYAN='\033[0;36m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
COLORRESET='\033[0m'

cowsay --rainbow --aurora --super -f daemon "favgen by TRHACKNON"

toilet -f mono12 -F border --gay "favgen by TRHACKNON" | lolcat

if ! command -v convert >/dev/null 2>&1; then
		echo -e "${RED}ImageMagick is not installed. Please install it to use this script.${COLORRESET}"
		exit 1
fi

show_menu() {
		echo -e "${CYAN}Please choose an option:${COLORRESET}"
		echo "1) Generate Favicons"
		echo "2) Generate Apple Touch Icons"
		echo "3) Generate Both"
		echo "4) Create a ZIP of all generated files"
		echo "5) Exit"
}

generate_favicons() {
		local sizes=("16x16" "32x32" "64x64" "96x96" "128x128" "256x256")
		local icons=()

		echo -e "${CYAN}Generating favicons...${COLORRESET}"
		for size in "${sizes[@]}"; do
				local output="${SRC_IMAGE/\.*/-$size.png}"
				convert "$NAME" -resize "$size" "$output"
				icons+=("$output")
				echo -e "${GREEN}Generated $output${COLORRESET}"
		done

		echo -e "${CYAN}Generating favicon.ico...${COLORRESET}"
		convert "${icons[@]:0:4}" -colors 256 favicon.ico
		echo -e "${GREEN}Generated favicon.ico${COLORRESET}"
}

generate_apple_icons() {
		local sizes=("152x152" "167x167" "180x180")
		local icons=()

		echo -e "${CYAN}Generating Apple Touch Icons...${COLORRESET}"
		for size in "${sizes[@]}"; do
				local output="${SRC_IMAGE/\.*/-apple-touch-icon-$size.png}"
				convert "$NAME" -resize "$size" "$output"
				icons+=("$output")
				echo -e "${GREEN}Generated $output${COLORRESET}"
		done
}

generate_both() {
		generate_favicons
		generate_apple_icons
}

create_html_tags() {
		local sizes=("16x16" "32x32" "64x64" "96x96" "128x128" "256x256")
		local apple_sizes=("152x152" "167x167" "180x180")

		echo -e "${CYAN}Creating HTML tags...${COLORRESET}"
		: > favicons.txt

		for size in "${sizes[@]}"; do
				echo "<link rel=\"icon\" type=\"image/png\" sizes=\"$size\" href=\"${SRC_IMAGE/\.*/-$size.png}\" />" >> favicons.txt
		done

		for size in "${apple_sizes[@]}"; do
				echo "<link rel=\"apple-touch-icon\" sizes=\"$size\" href=\"${SRC_IMAGE/\.*/-apple-touch-icon-$size.png}\" />" >> favicons.txt
		done

		echo -e "${GREEN}HTML tags created in favicons.txt${COLORRESET}"
}

create_manifest() {
		local icons=()
		local sizes=("72x72" "96x96" "128x128" "144x144" "152x152" "192x192" "384x384" "512x512")

		echo -e "${CYAN}Generating manifest.json...${COLORRESET}"
		: > manifest.json

		echo "{" >> manifest.json
		echo "  \"name\": \"$APP_NAME\"," >> manifest.json
		echo "  \"short_name\": \"$APP_NAME\"," >> manifest.json
		echo "  \"start_url\": \"/\"," >> manifest.json
		echo "  \"display\": \"standalone\"," >> manifest.json
		echo "  \"background_color\": \"#ffffff\"," >> manifest.json
		echo "  \"theme_color\": \"#000000\"," >> manifest.json
		echo "  \"icons\": [" >> manifest.json

		for size in "${sizes[@]}"; do
				local output="${SRC_IMAGE/\.*/-$size.png}"
				convert "$NAME" -resize "$size" "$output"
				icons+=("$output")
				echo "    {" >> manifest.json
				echo "      \"src\": \"${output}\"," >> manifest.json
				echo "      \"sizes\": \"$size\"," >> manifest.json
				echo "      \"type\": \"image/png\"" >> manifest.json
				echo "    }," >> manifest.json
				echo -e "${GREEN}Generated $output${COLORRESET}"
		done

		sed -i '$ s/,$//' manifest.json
		echo "  ]" >> manifest.json
		echo "}" >> manifest.json

		echo -e "${GREEN}manifest.json created${COLORRESET}"
}

create_zip() {
		echo -e "${CYAN}Creating ZIP file of all generated files...${COLORRESET}"
		zip -r generated_icons.zip ./*-*.png favicon.ico manifest.json favicons.txt
		echo -e "${GREEN}ZIP file created: generated_icons.zip${COLORRESET}"
}

echo -ne "${CYAN}Please enter the source image path: ${COLORRESET}"
read SRC_IMAGE

if [ -z "$SRC_IMAGE" ]; then
		echo -e "${RED}You must supply a source image.${COLORRESET}"
		exit 1
elif [ ! -f "$SRC_IMAGE" ]; then
		echo -e "${RED}Source image \"$SRC_IMAGE\" does not exist.${COLORRESET}"
		exit 1
fi

echo -ne "${CYAN}Please enter the application name: ${COLORRESET}"
read APP_NAME

NAME="${SRC_IMAGE/\.*/-512x512.png}"
echo -e "${CYAN}Generating square base image...${COLORRESET}"
convert "$SRC_IMAGE" -resize 512x512! -transparent white "$NAME"
echo -e "${GREEN}Generated base image $NAME${COLORRESET}"

while true; do
		show_menu
		echo -ne "${YELLOW}Enter your choice: ${COLORRESET}"
		read choice
		case $choice in
				1)
						generate_favicons
						;;
				2)
						generate_apple_icons
						;;
				3)
						generate_both
						;;
				4)
						create_zip
						;;
				5)
						echo -e "${CYAN}Exiting...${COLORRESET}"
						exit 0
						;;
				*)
						echo -e "${RED}Invalid choice. Please try again.${COLORRESET}"
						;;
		esac

		echo -ne "${YELLOW}Do you want to create HTML tags? (y/n): ${COLORRESET}"
		read create_tags
		if [[ $create_tags == "y" || $create_tags == "Y" ]]; then
				create_html_tags
		fi

		echo -ne "${YELLOW}Do you want to create manifest.json? (y/n): ${COLORRESET}"
		read create_manifest_json
		if [[ $create_manifest_json == "y" || $create_manifest_json == "Y" ]]; then
				create_manifest
		fi

		echo -ne "${YELLOW}Do you want to create a ZIP of all generated files? (y/n): ${COLORRESET}"
		read create_zip_files
		if [[ $create_zip_files == "y" || $create_zip_files == "Y" ]]; then
				create_zip
		fi

		echo -ne "${YELLOW}Do you want to perform another action? (y/n): ${COLORRESET}"
		read another_action
		if [[ $another_action != "y" && $another_action != "Y" ]]; then
				echo -e "${CYAN}Goodbye!${COLORRESET}"
				break
		fi
done