defmodule Game do
  alias TicTacToe.ConsoleBoardPrinter, as: BoardPrinter
  alias TicTacToe.Board
  alias TicTacToe.Referee
  alias TicTacToe.Player

  def start_game do
    players = [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ]

    Board.new
      |> BoardPrinter.print
      |> play(players)
  end

  defp play(board, [current_player | other_players]) do
    new_board = board
      |> Player.play(current_player)
      |> BoardPrinter.print

    case Referee.game_over?(new_board) do
      {:yes, _} -> IO.write("Game Over")
      _ -> play(new_board, other_players ++ [current_player])
    end
  end

end
