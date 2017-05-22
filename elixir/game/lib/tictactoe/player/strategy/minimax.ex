defmodule TicTacToe.Player.Strategy.Minimax do
  alias TicTacToe.Referee
  alias TicTacToe.Board

  def value(move, sign, board) do
    marked = board |> Board.mark(move, sign)
    
    case Referee.game_over?(marked) do
      {:yes, ^sign} -> 2
      {:yes, :none} -> 0
      _ -> max_value(marked, opponent(sign)) |> revert

    end

  end

  defp max_value(board, sign) do
    board
      |> Board.available_moves
      |> Enum.map(fn(move) -> value(move, sign, board) end)
      |> Enum.max
  end

  defp opponent(sign) do
    case sign, do: ("X"->"O"; _->"X")
  end

  defp revert(value) do
    case value do
      2 -> -1
      _ -> -value
    end
  end

end
