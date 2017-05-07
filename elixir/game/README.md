# Game

[![Build Status](https://travis-ci.org/danielemegna/TicTacToeKata.svg?branch=master)](https://travis-ci.org/danielemegna/TicTacToeKata)

Play the game with iex -S mix
> Game.start_game

### Notes

Docker dev-ready environment
```
$ docker run --rm -itv $(pwd):/app elixir:slim bash
```

Run tests into the container with
```
root@aea52b446155:/app# mix test
```
