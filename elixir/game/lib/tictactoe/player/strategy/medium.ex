defmodule TicTacToe.Player.Strategy.Medium do
  alias TicTacToe.Referee
  alias TicTacToe.Board

  def to_str, do: "Medium computer"

  def next_move(board, _) do
    board 
      |> Board.available_moves
      |> get_best_move(board)
  end

  defp get_best_move([4|_], _), do: 4
  defp get_best_move([move|[]], _), do: move

  defp get_best_move([move|rest], board) do
    if can_game_over?(board, move), do: move,
    else: get_best_move(rest, board)
  end

  defp can_game_over?(board, move) do
    Board.mark(board, move, "X") |> Referee.game_over? == {:yes, "X"}
    or
    Board.mark(board, move, "O") |> Referee.game_over? == {:yes, "O"}
  end

end
