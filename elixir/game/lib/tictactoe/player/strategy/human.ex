defmodule TicTacToe.Player.Strategy.Human do
  alias TicTacToe.Board

  def to_str, do: "Human"

  def next_move(board, _) do
    next_move(board)
  end

  defp next_move(board) do
    "Enter [0-8]>"
      |> IO.gets
      |> Integer.parse
      |> evaluate(board)
  end

  defp evaluate({move, _}, board) when move in 0..8 do
    unless Board.free?(board, move) do
      "Cell #{move} already marked! Retry.." |> IO.puts
      next_move(board)
    else
      move
    end
  end

  defp evaluate(_, board) do
    "Bad input! Retry.." |> IO.puts
    next_move(board)
  end

end
