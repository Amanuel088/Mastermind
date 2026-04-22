# Mastermind

A command-line implementation of the classic Mastermind board game, built in Ruby as part of [The Odin Project](https://www.theodinproject.com/) Ruby curriculum.

---

## About the Game

Mastermind is a code-breaking game where one player (or the computer) creates a secret code and the other tries to guess it within a limited number of turns. After each guess, feedback is given to help narrow down the answer.

---

## How to Play

- The computer randomly generates a secret code of 4 colors
- You have 12 turns to guess the correct code
- After each guess you receive feedback:

| Symbol | Meaning |
|--------|---------|
| ✓ | Right color, right position |
| o | Right color, wrong position |
| - | Color not in the code |

---

## Example

Secret code : [red, green, blue, yellow]
Your guess  : [red, blue, green, purple]
Feedback    : ✓oo-

- ✓  → red is correct position
- oo → blue and green are in the code but wrong position
- -  → purple is not in the code

---

## Available Colors

red  green  blue  yellow  orange  purple

---

## How to Run

Make sure you have Ruby installed, then:

git clone git@github.com:Amanuel088/Mastermind.git
cd Mastermind
ruby mastermind.rb

---

## What I Learned

- Object-Oriented Programming in Ruby (classes, encapsulation, single responsibility)
- Separation of concerns across multiple files using require_relative
- Git workflow — committing at meaningful milestones with clear messages
- Algorithm design — the Mastermind feedback logic (avoiding double-counting colors)
- Input validation and game loop design

---

## Project Status

- [x] Computer generates secret code
- [x] Human guesses with 12 turns
- [x] Feedback system (exact & color matches)
- [x] Input validation
- [x] Separation of concerns across lib/ files
- [x] Player chooses role (guesser or code maker)
- [x] Computer AI guesser (eliminates impossible codes after each guess)

---

## Built As Part Of

The Odin Project — Ruby Course
https://www.theodinproject.com/lessons/ruby-mastermind