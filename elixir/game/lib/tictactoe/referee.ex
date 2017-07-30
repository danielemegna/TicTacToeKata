defmodule TicTacToe.Referee do
  alias TicTacToe.Board

  def game_over?(board) do
    winner = winner(board)
    tie? = tie?(board)
    { end?(winner, tie?), winner }
  end

  defp winner(board) do
    consecutive_occurrences_in(board)
      |> keep_only_winner_signs
      |> winner_sign
  end

  defp consecutive_occurrences_in(board) do
    Enum.map(0..board.size-1, fn(i) -> [
      Board.row(board,i)            |> consecutive_occurrences,
      Board.column(board,i)         |> consecutive_occurrences,
      Board.diagonal(board,i,:up)   |> consecutive_occurrences,
      Board.diagonal(board,i,:down) |> consecutive_occurrences,
    ] end) |> List.flatten
  end

  defp consecutive_occurrences(list) do
    Enum.reduce(list, [], fn(value, result) ->
      case result do
        [{^value,n} | tail] -> [{value,n+1} | tail]
        result -> [{value, 1} | result]
      end
    end)
    |> Enum.reverse
  end

  defp keep_only_winner_signs(consecutive_occurrences) do
    consecutive_occurrences
      |> Enum.filter(&(elem(&1,0) != :empty and elem(&1,1) >= 3))
  end

  defp winner_sign([]), do: :none
  defp winner_sign([{winner,_}|_]), do: winner

  defp end?(_, true), do: :yes
  defp end?(:none, _), do: :no
  defp end?(_, _), do: :yes

  defp tie?(board), do: Board.full?(board)

end
