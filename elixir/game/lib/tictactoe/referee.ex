defmodule TicTacToe.Referee do
  alias TicTacToe.Board

  def game_over?(board) do
    winner = winner(board)
    tie? = tie?(board)
    { end?(winner, tie?), winner }
  end

  defp winner(board) do
    win_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    win_combinations
      |> signs_in_combinations(board)
      |> keep_only_winner_signs
      |> winner_sign
  end

  defp signs_in_combinations(combinations, board) do
    Enum.map(combinations, &(signs_in_combination(&1, board)))
  end

  defp signs_in_combination(combination, board) do
    combination
      |> Enum.map(&(Board.at(board, &1)))
      |> Enum.uniq
  end

  defp keep_only_winner_signs(signs_in_combinations) do
    signs_in_combinations
      |> Enum.filter(&(Enum.count(&1) == 1))
      |> List.flatten
  end

  defp winner_sign([]), do: :none
  defp winner_sign([winner|_]), do: winner

  defp end?(_, true), do: :yes
  defp end?(:none, _), do: :no
  defp end?(_, _), do: :yes

  defp tie?(board), do: Board.full?(board)

end
