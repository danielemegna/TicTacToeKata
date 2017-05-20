defmodule TicTacToe.Player.Strategy.Medium do
  alias TicTacToe.Referee
  alias TicTacToe.Board

  def next_move(board, my_sign) do
    cond do
      Board.free?(board, 4) -> 4
      true -> evaluate(board, my_sign)
    end
  end

  defp evaluate(board, my_sign) do
    available_moves = Board.available_moves(board)
    get_best_move(available_moves, board, my_sign)
  end

  defp get_best_move([first|[]], _, _) do
    first
  end

  defp get_best_move([first_index|rest], board, my_sign) do
    opponent_sign = opponent_sign(my_sign)
    cond do
      Referee.game_over?(Board.mark(board, first_index, my_sign)) == {:yes, my_sign} -> first_index
      Referee.game_over?(Board.mark(board, first_index, opponent_sign)) == {:yes, opponent_sign} -> first_index
      true -> get_best_move(rest, board, my_sign)
    end
  end

  defp opponent_sign(my_sign) do
    case my_sign, do: ("X"->"O"; _->"X")
  end

end
