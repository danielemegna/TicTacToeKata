defmodule TicTacToe.IOAdapter do
  alias TicTacToe.Board

  def game_type? do
    "Choose game type\n"<>
    " 1. Human v. Human\n"<>
    " 2. Human v. Computer\n"<>
    " 3. Computer v. Human\n"<>
    " 4. Computer v. Computer\n"<>
    "Enter [1-4]>"
      |> IO.gets
      |> Integer.parse
  end

  def difficulty_level?(sign) do
    "Choose computer level of difficulty ('#{sign}' symbol player)\n"<>
    " 1. Easy\n"<>
    " 2. Medium\n"<>
    " 3. Hard (unbeatable)\n" <>
    "Enter [1-3]>"
      |> IO.gets
      |> Integer.parse
  end

  def next_move?(sign, last_index) do
    "'#{sign}' player, choose your next move!\n"<>
    "Enter [0-#{last_index}]>"
      |> IO.gets
      |> Integer.parse
  end

  def cell_marked(sign, position), do:
    "'#{sign}' marked #{position} position" |> IO.puts

  def cell_already_marked(position), do:
    "Cell #{position} already marked! Retry..\n" |> IO.puts
    
  def bad_input, do: "Bad input! Retry..\n" |> IO.puts
  def tie_game, do: "Tie! Game Over" |> IO.puts
  def win_game(winner), do: "#{winner} wins! Game Over" |> IO.puts

  def print_board(board) do
    border_for(board.size) <>
    rows_string(board) <>
    border_for(board.size) |> IO.write

    board
  end

  defp border_for(size) do
   border = List.duplicate("---", size)
    |> Enum.join("-")
    
    "\n\n-" <> border <> "--\n\n"
  end

  defp rows_string(board) do
    row_separator = row_separator_for(board.size)
    0..board.size-1
      |> Enum.map(&(row_string(board, &1)))
      |> Enum.join(row_separator)
  end

  defp row_separator_for(size) do
    row_separator = List.duplicate("===", size)
      |> Enum.join("+")

    "\n " <> row_separator <> " \n"
  end

  defp row_string(board, row) do
    row = 0..board.size-1
      |> Enum.map(&(cell_string(board, row, &1)))
      |> Enum.join("  ")

    "  " <> row
  end

  defp cell_string(board, row, column) do
    index = column + (row * board.size)
    case Board.at(board, index) do
      :empty -> to_string(index)
      value -> value
    end |> String.pad_trailing(2)
  end

end
