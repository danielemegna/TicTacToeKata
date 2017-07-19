defmodule TicTacToe.Player.Strategy.Human do
  alias TicTacToe.Board
  alias TicTacToe.IOAdapter

  def next_move(board, sign) do
    "'#{sign}' player, choose your next move!\n"<>
    "Enter [0-8]>"
      |> IO.gets
      |> Integer.parse
      |> evaluate(board,sign)
  end

  defp evaluate({move, _}, board, sign) when move in 0..8 do
    unless Board.free?(board, move) do
      IOAdapter.cell_already_marked(move)
      next_move(board, sign)
    else
      move
    end
  end

  defp evaluate(_, board, sign) do
    IOAdapter.bad_input()
    next_move(board, sign)
  end

end
