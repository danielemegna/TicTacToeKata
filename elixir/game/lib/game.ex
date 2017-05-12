defmodule Game do
  alias TicTacToe.ConsoleBoardPrinter, as: BoardPrinter
  alias TicTacToe.Board
  alias TicTacToe.Referee

  @players %{
    "X" => TicTacToe.HumanPlayer,
    "O" => TicTacToe.MediumPlayer
  }

  def start_game do
    board = %Board{}
    BoardPrinter.print(board)
    play_moves(board, "X")
  end

  defp play_moves(board, player) do
    if(Referee.game_over?(board) || Referee.tie?(board)) do
      IO.write("Game Over")
    else
      play_moves(choose_move(board, player), toggle_player(player))
    end
  end

  defp choose_move(board, player) do
    move = @players[player].next_move(board)

    updated_board = Board.mark(board, move, player)
    BoardPrinter.print(updated_board)
    updated_board
  end

  defp toggle_player(player) do
    if(player == "X") do
      "O"
    else "X"
    end
  end

end
