defmodule TicTacToe.MediumPlayer do

  def next_move(board) do
    cond do
      Enum.at(board, 4) == 4 -> 4
      true -> evaluate(board)
    end
  end

  defp evaluate(board) do
    indexed_board = Enum.with_index(board, 0)
    filtered = Enum.filter(indexed_board, fn({value, _}) -> value != "X" && value != "O" end)
    available_moves = Enum.map(filtered, fn({_, index}) -> index end)
    get_best_move(available_moves, board)
  end

  defp get_best_move([first|[]], _) do
    first
  end

  defp get_best_move([first_index|rest], board) do
    cond do
      game_over(List.update_at(board, first_index, fn(_) -> "O" end)) -> first_index
      game_over(List.update_at(board, first_index, fn(_) -> "X" end)) -> first_index
      true -> get_best_move(rest, board)
    end
  end

  defp game_over(board) do
    TicTacToe.Referee.game_over?(board)
  end

end
