defmodule TicTacToe.Player.Strategy.Hard do
  alias TicTacToe.Board
  alias TicTacToe.Player.Strategy.Minimax

  def next_move(board, my_sign) do
    cond do
      first_move?(board) -> 0
      second_move?(board) and Board.free?(board, 4) -> 4
      second_move?(board) and !Board.free?(board, 4) -> 0
      true -> minimax(board, my_sign)
    end
  end

  defp minimax(board, my_sign) do
    board
      |> Board.available_moves
      |> parallelmap(&({ &1, Minimax.value(&1, my_sign, board) }))
      |> Enum.max_by(fn({_,value}) -> value end)
      |> elem(0)
  end

  defp first_move?(board) do
    board |> Board.available_moves |> Enum.count == 9
  end

  defp second_move?(board) do
    board |> Board.available_moves |> Enum.count == 8
  end

  defp parallelmap(collection, func, timeout \\ 20000) do
    collection
      |> Enum.map(&(Task.async(fn -> func.(&1) end)))
      |> Enum.map(&(Task.await(&1, timeout)))
  end

end
