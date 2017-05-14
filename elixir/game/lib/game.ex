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

  defp play(board, players) do
    current_player = List.first(players)
    updated_board = choose_move(board, current_player)
    BoardPrinter.print(updated_board)

    if(Referee.game_over?(updated_board) || Referee.tie?(updated_board)) do
      IO.write("Game Over")
    else
      play(updated_board, Enum.reverse(players))
    end
  end

  defp choose_move(board, player) do
    board |> Board.mark(
      player.strategy.next_move(board),
      player.sign
    )
  end

end
