defmodule TicTacToe.Player.Strategy.Minimax_Test do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.Player.Strategy.Minimax

  test 'last tie move worth zero' do
    assert evaluate([
      "X","O","X",
      "O","X", 5 ,
      "O","X","O"
    ], 5) == 0
  end

  test 'one-move win worth two' do
    assert evaluate([
       0 ,"O","X",
      "O","X","O",
      "O","X","O"
    ], 0) == 2
  end
  
  test 'let opponent win worth minus one' do
    assert evaluate([
       0 , 1 ,"O",
      "X","X","O",
      "X","O","X"
    ], 1) == -1
  end

  test 'any move value zero with no chance of win' do
    board = [
       0 , 1 ,"X",
      "X","O","O",
       6 , 7 ,"X"
    ]

    assert evaluate(board, 0) == 0
    assert evaluate(board, 1) == 0
    assert evaluate(board, 6) == 0
    assert evaluate(board, 7) == 0
  end

  test 'any move that lead to defeat worth -1' do
    board = [
      "X", 1 , 2 ,
       3 , 4 , 5 ,
       6 , 7 , 8 
    ]

    assert evaluate(board, 4) == 0
    assert evaluate(board, 2) == -1
    assert evaluate(board, 3) == -1
    assert evaluate(board, 5) == -1
    assert evaluate(board, 8) == -1
  end

  test 'moves worth 1 when lead to sure win' do
    board = [
       0 , 1 ,"X",
       3 , 4 , 5 ,
       6 , 7 ,"O"
    ]

    # win moves
    assert evaluate(board, 0) == 1
    assert evaluate(board, 6) == 1
    assert evaluate(board, 7) == 1

    # tie moves
    assert evaluate(board, 1) == 0
    assert evaluate(board, 3) == 0
    assert evaluate(board, 4) == 0

    # defeat move
    assert evaluate(board, 5) == -1
  end

  defp evaluate(board, move) do
    Minimax.value(move, "O", Board.new(board))
  end

end
