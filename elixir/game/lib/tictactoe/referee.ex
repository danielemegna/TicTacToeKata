defmodule TicTacToe.Referee do
  alias TicTacToe.Board

  def game_over?(board) do
    { end?(board), winner(board) }
  end

  defp end?(board) do
    cond do
      winner(board) != :none -> :yes
      tie?(board) -> :yes
      true -> :no
    end
  end

  defp winner(board) do
    win_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    winner = win_combinations
      |> Enum.map(fn(combination) -> combination
        |> Enum.map(&(Board.at(board, &1)))
        |> Enum.uniq
      end)
      |> Enum.filter(&(Enum.count(&1) == 1))
      |> List.flatten

    List.first(winner ++ [:none])
  end

  defp tie?(board) do
    Board.full?(board)
  end

end
