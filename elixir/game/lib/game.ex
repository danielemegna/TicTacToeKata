defmodule Game do
  alias TicTacToe.{Board,Referee,Player,PlayerChooser,PlayerFactory,IOAdapter}

  def start_game do
    players = PlayerChooser.start |> PlayerFactory.build

    Board.new
      |> IOAdapter.print_board
      |> play(players)
  end

  defp play(board, [current_player | other_players]) do
    new_board = board
      |> Player.play(current_player)
      |> IOAdapter.print_board

    case Referee.game_over?(new_board) do
      {:yes, :none} -> IOAdapter.tie_game
      {:yes, winner} -> IOAdapter.win_game(winner) 
      {:no, _} -> play(new_board, other_players ++ [current_player])
    end
  end

end
