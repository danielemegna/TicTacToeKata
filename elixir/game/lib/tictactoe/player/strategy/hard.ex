defmodule TicTacToe.Player.Strategy.Hard do
  alias TicTacToe.Referee
  alias TicTacToe.Board

  def next_move(board, my_sign) do
    board
      |> Board.available_moves
      |> get_best_move(board, my_sign)
  end

  defp get_best_move([move|[]], _, _) do
    move
  end

  defp get_best_move([move|rest], board, my_sign) do
    marked_board = Board.mark(board, move, my_sign)
    case Referee.game_over?(marked_board) do
      {:yes, ^my_sign} -> move
      _ -> get_best_move(rest, board, my_sign)
    end
  end

end
