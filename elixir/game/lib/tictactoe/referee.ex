defmodule TicTacToe.Referee do
  alias TicTacToe.Board

  @consecutive_occurrences_for_win 3

  def game_over?(board) do
    winner = winner(board)
    full? = full?(board)
    { end?(winner, full?), winner }
  end

  defp winner(board) do
    consecutive_occurrences_in(board)
      |> keep_only_winner_signs
      |> winner_sign
  end

  defp consecutive_occurrences_in(board) do
    Board.lines(board)
      |> Enum.map(&(consecutive_occurrences(&1)))
      |> List.flatten
  end

  defp consecutive_occurrences(line) do
    Enum.reduce(line, [], fn(current, result) ->
      case result do
        [{^current,n} | tail] -> [{current,n+1} | tail]
        _ -> [{current, 1} | result]
      end
    end) |> Enum.reverse
  end

  defp keep_only_winner_signs(consecutive_occurrences) do
    consecutive_occurrences |> Enum.filter(fn({value, count}) ->
      value != :empty and count >= @consecutive_occurrences_for_win
    end)
  end

  defp winner_sign([]), do: :none
  defp winner_sign([{winner,_}|_]), do: winner

  defp end?(_, true), do: :yes
  defp end?(:none, _), do: :no
  defp end?(_, _), do: :yes

  defp full?(board), do: Board.full?(board)

end
