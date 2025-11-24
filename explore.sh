#!/usr/bin/env bash

# ==============================
# 1. 맵 불러오기
# ==============================

map=()
while IFS= read -r line; do
	map+=("$line")
done < map.txt

HEIGHT=${#map[@]}
WIDTH=${#map[0]}

# ==============================
# 2. 플레이어 좌표 설정
# ==============================

player_x=1 # 열 (0부터 시작)
player_y=1 # 행 (0부터 시작)

# ==============================
# 3. 렌더링 함수
# ==============================

draw() {
	clear
	echo "=== Bash Explore Game ==="
	echo
	echo "Player position: ($player_x, $player_y)"
	echo

	for ((y=0; y<HEIGHT; y++)); do
		row="${map[$y]}"
		line=""
		for ((x=0; x<WIDTH; x++)); do
			if [[ $y -eq $player_y && $x -eq $player_x ]]; then
				line+="P"
			else
				tile="${row:$x:1}"
				line+="$tile"
			fi
		done
		echo "$line"
	done
	
	echo
	echo "W/A/S/D to move, Q to quit"
}

# ==============================
# 4. 메인 게임 루프
# ==============================

while true; do
  draw
  read -n1 -p "Input > " key
  echo

  # 기본값: 움직이기 전 좌표를 복사해둔다
  new_x=$player_x
  new_y=$player_y

  case "$key" in
    q|Q)
      echo "Bye!"
      break
      ;;
    w|W)
      ((new_y--))
      ;;
    s|S)
      ((new_y++))   # 아래로 한 칸
      ;;
    a|A)
      ((new_x--))   # 왼쪽으로 한 칸
      ;;
    d|D)
      ((new_x++))   # 오른쪽으로 한 칸
      ;;
    *)
      # 다른 키는 무시      
      ;;
  esac

  # 방향키가 아닌 경우엔 여기서 바로 다음 루프로
  if [[ "$key" != [WwAaSsDd] ]]; then
    continue
  fi

  # 1) 맵 범위 안인지 확인
  if (( new_x < 0 || new_x >= WIDTH || new_y < 0 || new_y >= HEIGHT )); then
    # 범위 밖이면 이동 취소
    continue
  fi

  # 2) 벽인지 확인
  row="${map[$new_y]}"
  tile="${row:$new_x:1}"

  if [[ "$tile" == "#" ]]; then
    # 벽이면 이동 안 함
    continue
  fi

  # 여기까지 왔다는 건: 범위 안이고, 벽도 아님 → 이동!
  player_x=$new_x
  player_y=$new_y
done
