defmodule TicTacToe.Player.Strategy.Human do
  alias TicTacToe.Board

  def next_move(board) do
    IO.write("Enter [0-8]")
    Integer.parse(IO.gets(">"))
      |> evaluate(board)
  end

  defp evaluate({move, _}, board) do
  
    cond do
      (move < 0 || move > 8) ->
        IO.puts("Bad input! Retry..")
        next_move(board)
      Board.free?(board, move) ->
        move
      true ->
        IO.puts("Cell #{move} already marked! Retry..")
        next_move(board)
    end
  end

  defp evaluate(:error, board) do
      IO.puts("Bad input! Retry..")
      next_move(board)
  end

end
