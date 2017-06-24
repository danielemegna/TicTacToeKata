# Game

[![Build Status](https://travis-ci.org/danielemegna/TicTacToeKata.svg?branch=master)](https://travis-ci.org/danielemegna/TicTacToeKata)

Play the game with iex -S mix
> Game.start_game

### Todo list

First iteration
- [x] The game does not gracefully handle bad user input.
  - [x] Handle not integer bad input
  - [x] Handle out of board index input
- [x] In its current form, it’s supposed to be played at a difficulty level of “hard”, meaning the computer player cannot be beaten, but in reality you can beat it with the right moves.
- [x] The game play left a lot to be desired. The user messages are lacking in many ways, which I’m sure you can tell.
  - [x] Announce correctly tie game over
  - [x] Announce correctly winner symbol / player

Second iteration
- [x] Allow the user to choose the level of difficulty (“easy” means the computer can easily be beaten, “medium” means it can be beaten but only with a series of intelligent moves, and “hard” means the it is unbeatable).
- [x] Allow the user to choose the game type (human v. human, computer v. computer, human v. computer).
- [x] Allow the user to choose which player goes first.
- [x] Allow the user to choose with what “symbol” the players will mark their selections on the board (traditionally it’s “X” and “O”).
- [x] Print out computer player symbol during difficulty choice
- [x] Print out last move information
- [ ] Print "Choose your next move" message ?


### Notes

Docker dev-ready environment
```
$ docker run --rm -itv $(pwd):/app elixir:slim bash
```

Run tests into the container with
```
root@aea52b446155:/app# mix test
```
