defmodule Game do
  alias TicTacToe.ConsoleBoardPrinter, as: BoardPrinter
  alias TicTacToe.Board
  alias TicTacToe.Referee
  alias TicTacToe.Player

  def start_game do
    players = [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Medium }
    ]

    %Board{}
      |> BoardPrinter.print
      |> play(players)
  end

  defp play(board, [current_player | other_players]) do
    new_board = board
      |> Player.play(current_player)
      |> BoardPrinter.print

    if(Referee.game_over?(new_board)) do
      IO.write("Game Over")
    else
      play(new_board, other_players ++ [current_player])
    end
  end

end
