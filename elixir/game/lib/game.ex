defmodule Game do
  alias TicTacToe.ConsoleBoardPrinter, as: BoardPrinter
  alias TicTacToe.Board

  @players %{
    "X" => TicTacToe.HumanPlayer,
    "O" => TicTacToe.MediumPlayer
  }

  def start_game do
    b = %Board{}
    print_board(b)
    play_moves(b, "X")
  end

  def play_moves(board, player) do
    if(game_over(board) || tie(board)) do
      IO.write("Game Over")
    else
      play_moves(choose_move(board, player), toggle_player(player))
    end
  end

  def choose_move(board, player) do
    move = @players[player].next_move(board)

    updated_board = Board.mark(board, move, player)
    print_board(updated_board)
    updated_board
  end

  def toggle_player(player) do
    if(player == "X") do
      "O"
    else "X"
    end
  end

  defp tie(board) do
    TicTacToe.Referee.tie?(board)
  end

  defp game_over(board) do
    TicTacToe.Referee.game_over?(board)
  end

  defp print_board(b) do
    BoardPrinter.print(b)
  end

end
