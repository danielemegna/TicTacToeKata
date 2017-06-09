defmodule Game do
  alias TicTacToe.{Board,Referee,Player,PlayerFactory}

  def start_game do
    Board.new
      |> Board.print
      |> play(PlayerFactory.pair)
  end

  defp play(board, [current_player | other_players]) do
    new_board = board
      |> Player.play(current_player)
      |> Board.print

    Referee.game_over?(new_board)
      |> Referee.announce_or(fn() ->
          play(new_board, other_players ++ [current_player])
        end)
  end

end
