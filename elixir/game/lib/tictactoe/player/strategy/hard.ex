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
    cond do
      Referee.game_over?(Board.mark(board, move, my_sign)) -> move
      true -> get_best_move(rest, board, my_sign)
    end
  end

end
