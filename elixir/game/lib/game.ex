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

    board = %Board{}
    BoardPrinter.print(board)
    play_moves(board, players)
  end

  defp play_moves(board, players) do
    if(Referee.game_over?(board) || Referee.tie?(board)) do
      IO.write("Game Over")
    else
      current_player = List.first(players)
      updated_board = choose_move(board, current_player)
      play_moves(updated_board, Enum.reverse(players))
    end
  end

  defp choose_move(board, player) do
    move = player.strategy.next_move(board)

    updated_board = Board.mark(board, move, player.sign)
    BoardPrinter.print(updated_board)
    updated_board
  end

end
