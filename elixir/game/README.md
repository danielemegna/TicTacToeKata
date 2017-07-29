# TicTacToe Game

[![Build Status](https://travis-ci.org/danielemegna/TicTacToeKata.svg?branch=master)](https://travis-ci.org/danielemegna/TicTacToeKata)

## Requirements

`Elixir ~1.5.0`
or
`Docker ~17.06`

## How to start a new game

Start the Elixir's interactive shell with
```
iex -S mix
```
and start the game with
```
> Game.start_game
```

## Run with docker

Build a new docker image `ttt` with
```
$ docker build -t ttt
```
run it with
```
$ docker run --rm -it ttt
```
Elixir's interactive shell is already opened,
start the game with
```
> Game.start_game
```

## Run tests

```
$ mix test
```
or with docker (after a `docker build -t ttt`)
```
$ docker run --rm -it ttt mix test
```

_________

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

Final improvements
- [x] Print out computer player symbol during difficulty choice
- [x] Print out last move information
- [x] Print "Choose your next move" message
- [x] Human player tests could be improved
- [x] Player module unit tests ?
- [x] Assert multiple contains in tests ?

Third iteration (code review)
- [x] Specify Elixir supported version
- [x] Remove IO dependecy from game logic modules
- [ ] Remove duplication of knowledge about the board dimension
  - [ ] Re-design Board struct: infinite map and size as build param
  - [ ] Change Referee win logic
  - [ ] Change Human strategy move validation logic (use new Argument Error)
  - [ ] Change IO.print_board logic
- [ ] Split PlayerFactory: separate IO user questions from players build logic
- [x] Remove from refree "announce_or" logic: keep game flow logic in Game module
- [x] Board.at should not return index when cell is not marked
- [ ] Mock Minimax module in Player.Strategy.Hard_Test ?
- [ ] Mock IOAdapter where CaptureIO is used in tests ?

### Notes

Docker dev-ready environment with code mounted as volume
```
$ docker run --rm -itv $(pwd):/app -w /app elixir:1.5.0-slim bash
```

Run tests into the container with
```
root@aea52b446155:/app# mix test
```
