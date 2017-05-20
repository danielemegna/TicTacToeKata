defmodule TicTacToe.Player.Strategy.Minimax_Test do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.Player.Strategy.Minimax

  test 'last tie move worth zero' do
    board = %Board{cells: [
      "X","O","X",
      "O","X", 5 ,
      "O","X","O"
    ]}

    assert Minimax.value(5, "O", board) == 0
  end

  test 'win move worth two' do
    board = %Board{cells: [
      "X","O", 2 ,
      "O","X","O",
      "O","X","O"
    ]}

    assert Minimax.value(2, "O", board) == 2
  end

end
