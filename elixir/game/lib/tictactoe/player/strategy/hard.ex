defmodule TicTacToe.Player.Strategy.Hard do
  alias TicTacToe.Board
  alias TicTacToe.Player.Strategy.Minimax

  def next_move(board, my_sign) do
    board
      |> Board.available_moves
      |> Enum.map(&({ &1, Minimax.value(&1, my_sign, board) }))
      |> Enum.max_by(fn({_,value}) -> value end)
      |> elem(0)
  end

end
