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

  test 'win move worth two' do
    assert evaluate([
       0 ,"O","X",
      "O","X","O",
      "O","X","O"
    ], 0) == 2
  end

  defp evaluate(cells, move) do
    Minimax.value(move, "O", %Board{cells: cells})
  end

end
