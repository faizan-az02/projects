# Duck Shoot Game – x86 Assembly Edition

Welcome to the Duck Shoot Game repository! This project is a classic pixel-perfect shooting game written entirely in **x86 Assembly**. The game challenges players to shoot a moving duck on the screen using the mouse, with increasing difficulty levels and bullet limits. Every pixel, frame, and interaction was manually handled in assembly — making this both a technical and creative feat.

---

## 🎯 Project Overview

Duck Shoot is an interactive 2D shooting game built using low-level graphics in **x86 assembly language**, directly controlling video memory and mouse input. The player aims to shoot a duck as it moves across the screen. The game features multiple rounds, scoring mechanics, difficulty modes, and persistent score tracking via file I/O.

---

## 👥 Acknowledgements

- This project was created as a demonstration of graphical and interactive programming in x86 Assembly.
- It was a group project and my mate was Hasnain Raza.

---

## 🕹️ Gameplay Mechanics

- A duck moves across the screen — either slowly or quickly based on mode.
- The player controls a mouse cursor to aim and click.
- If the click hits the duck, the score increases.
- If the click misses, nothing happens.
- Game consists of **3 rounds per mode**.
- In fast mode, there's an additional constraint: **limited bullets**.
- Score is **saved to and loaded from a file** between rounds or sessions.

---

## 🧠 Technical Approach

```assembly
; Duck Shoot Game – x86 Assembly Summary

This game was developed in real-mode x86 assembly using pixel-by-pixel graphics rendering.

Graphics & Input:
- Video mode was set manually.
- Duck sprite and cursor were drawn pixel-by-pixel directly to video memory.
- Mouse input was handled through BIOS interrupts (INT 33h).
- Collision detection was implemented by comparing mouse click coordinates 
  with duck's bounding box on each frame.

Game Logic:
- A timer/loop was used to update duck position smoothly across frames.
- Speed varied between slow and fast modes.
- Bullet count was decremented and displayed in fast mode.
- Score was updated in memory and persisted using file I/O routines (INT 21h).

Persistence:
- Score was saved to a file after each session using DOS interrupt services.
- At game start, score was read back and displayed.

Modes:
1. **Easy Mode**: Slow duck, unlimited bullets.
2. **Hard Mode**: Fast duck, limited bullets.
3. **3 Rounds per Mode**, then results are finalized.

Every screen, every bit of motion, every pixel: manually controlled in assembly!
