defmodule TicTacToe.Player.Strategy.Medium do
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

  defp get_best_move([4|_], _, _) do
    4
  end

  defp get_best_move([move|rest], board, my_sign) do
    can_game_over? = 
      Referee.game_over?(
        board |> Board.mark(move, my_sign)
      ) == {:yes, my_sign}
      ||
      Referee.game_over?(
        board |> Board.mark(move, opponent(my_sign))
      ) == {:yes, opponent(my_sign)}
  
    if can_game_over? do
      move
    else
      get_best_move(rest, board, my_sign)
    end
  end

  defp opponent(sign) do
    case sign, do: ("X"->"O"; _->"X")
  end

end
