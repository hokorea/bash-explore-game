#!/usr/bin/env bash

# map 파일을 배열로 읽기
map=()
while IFS= read -r line; do
	map+=("$line")
done < map.txt

player_x=0
player_y=0

for ((y=0; y<${#map[@]}; y++)); do
	row="${map[$y]}"
	for ((x=0; x<${#row}; x++)); do
		if [[ "${row:$x:1}" == "P" ]]; then
			player_x=$x
			player_y=$y
		fi
	done
done		

draw() {
	clear
	echo "=== 탐험 게임 ==="
	echo
	echo "플레이어의 위치 (${player_x}, ${player_y})"
	cat map.txt
	echo
	echo "W/A/S/D: 이동(나중에 만들기), Q: 종료"
}

while true; do
	draw
	read -n1 -p "키 입력 > " key
	echo

	if [[ "$key" == "q" || "$key" == "Q" ]]; then
		echo "게임을 종료합니다."
		break
	fi
done
