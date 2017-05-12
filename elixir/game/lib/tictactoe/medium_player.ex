defmodule TicTacToe.MediumPlayer do
  alias TicTacToe.Referee
  alias TicTacToe.Board

  def next_move(board) do
    cond do
      Board.free?(%Board{cells: board}, 4) -> 4
      true -> evaluate(board)
    end
  end

  defp evaluate(board) do
    available_moves = Board.available_moves(%Board{cells: board})
    get_best_move(available_moves, board)
  end

  defp get_best_move([first|[]], _) do
    first
  end

  defp get_best_move([first_index|rest], board) do
    cond do
      Referee.game_over?(%Board{cells: List.update_at(board, first_index, fn(_) -> "O" end)}) -> first_index
      Referee.game_over?(%Board{cells: List.update_at(board, first_index, fn(_) -> "X" end)}) -> first_index
      true -> get_best_move(rest, board)
    end
  end

end
