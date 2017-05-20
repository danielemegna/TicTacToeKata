defmodule TicTacToe.Player.Strategy.Minimax do
  alias TicTacToe.Referee
  alias TicTacToe.Board

  def value(move, sign, board) do
    case Referee.game_over?(board |> Board.mark(move, sign)) do
      {:yes, ^sign} -> 2
      _ -> 0
    end
  end

end
