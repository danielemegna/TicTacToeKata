defmodule TicTacToe.Player.Strategy.Human do
  alias TicTacToe.Board

  def next_move(board, sign) do
    "'#{sign}' player, choose your next move!\n"<>
    "Enter [0-8]>"
      |> IO.gets
      |> Integer.parse
      |> evaluate(board,sign)
  end

  defp evaluate({move, _}, board, sign) when move in 0..8 do
    unless Board.free?(board, move) do
      "Cell #{move} already marked! Retry.." |> IO.puts
      next_move(board, sign)
    else
      move
    end
  end

  defp evaluate(_, board, sign) do
    "Bad input! Retry.." |> IO.puts
    next_move(board, sign)
  end

end
