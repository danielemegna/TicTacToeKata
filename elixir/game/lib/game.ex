defmodule Game do
  alias TicTacToe.ConsoleBoardPrinter, as: BoardPrinter

  def start_game do
    b = [0, 1, 2, 3, 4, 5, 6, 7, 8]
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
    cond do
      player == "X" -> get_humans_turn(board)
      player == "O" -> get_computers_turn(board)
    end
  end

  def toggle_player(player) do
    if(player == "X") do
      "O"
    else "X"
    end
  end

  defp get_humans_turn(board) do
    move = TicTacToe.HumanPlayer.next_move(board)

    updated_board = List.update_at(board, move, fn(x) -> "X" end)
    print_board(updated_board)
    updated_board
  end

  defp get_computers_turn(board) do
    move = TicTacToe.MediumPlayer.next_move(board)

    updated_board = List.update_at(board, move, fn(x) -> "O" end)
    print_board(updated_board)
    updated_board
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
