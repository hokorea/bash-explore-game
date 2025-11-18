# bash-explore-game
A simple text-based exploration game written in Bash.

# Bash Explore Game

A minimal text-based exploration game built while learning Bash scripting, Linux workflow, and the `vi` editor.  
This project is my personal step toward understanding how games work at a very low level — using only the terminal, text files, and basic input handling.

---

## 🎮 Overview

This game loads a map from `map.txt` and dynamically draws the player (`P`) based on coordinates inside the script.  
The goal is to build a small exploration engine that updates the terminal in real time as the player moves.

This project focuses on:

- Reading and processing files in Bash  
- Managing player coordinates  
- Building a simple real-time game loop  
- Redrawing the screen frame-by-frame  
- Practicing Git & GitHub version control  
- Improving my Linux + `vi` workflow

---

## 🗺 Map System

The map is stored as a plain ASCII-based text file:

### Legend
- `#` — Wall  
- `.` — Floor  
- `E` — Exit  
- `P` — Player (drawn dynamically, **not** stored in the map file)

The script loads this into an array, then renders the player on top based on `(player_x, player_y)`.

---

## ⌨ Controls (WIP)

Movement will be added step-by-step.

- **W** — Move Up *(coming soon)*  
- **A** — Move Left *(coming soon)*  
- **S** — Move Down *(coming soon)*  
- **D** — Move Right *(coming soon)*  
- **Q** — Quit Game

---

## 🛠 Features (Current & Planned)

### ✔ Current
- Map loading system  
- Dynamic rendering with player coordinates  
- Basic game loop  
- Terminal screen refresh  

### 🚧 Planned
- WASD movement  
- Wall collision  
- Exit detection (clear screen on reaching `E`)  
- Multiple maps / stage system  
- ASCII tilesets  
- Simple events or interactions  
- Maybe items, NPCs, or small monsters later

---

## 📂 Project Structure

bash-explore-game/
├ explore.sh # main game script
├ map.txt # ASCII map file
├ LICENSE # MIT License
├ .gitignore # ignore temp/editor files
└ README.md # this file

---

## 🎯 Purpose

This project is part of my personal journey in:

Learning Bash and Linux properly

Understanding text-based rendering

Using version control in real projects

Thinking like a game programmer (map, grid, loop, state)

Building a foundation before moving into C, C++, or game engines

It’s small, but it represents the beginning of something bigger.

## 📝 License

This project is licensed under the MIT License.
Feel free to use, modify, and distribute it as long as the original license is included.

---
