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

  def next_move?(sign) do
    "'#{sign}' player, choose your next move!\n"<>
    "Enter [0-8]>"
      |> IO.gets
      |> Integer.parse
  end

  def print_board(board) do
    bound = board.size-1

    border = 0..bound
      |> Enum.map(fn(_) -> "---" end)
      |> Enum.join("-")
    border = "\n\n-" <> border <> "--\n\n"

    row_separator = 0..bound
      |> Enum.map(fn(_) -> "===" end)
      |> Enum.join("+")
    row_separator = "\n " <> row_separator <> " \n"

    rows = 0..bound |> Enum.map(fn(row) ->
      0..bound |> Enum.reduce("", fn(column, acc) ->
          acc <> "  #{board_cell_string(board, column + (row*board.size))} "
        end)
      end)

    border |> IO.write
    rows |> Enum.join(row_separator) |> IO.write
    border |> IO.write

    board
  end

  def cell_marked(sign, position), do:
    "'#{sign}' marked #{position} position" |> IO.puts

  def cell_already_marked(position), do:
    "Cell #{position} already marked! Retry..\n" |> IO.puts
    
  def bad_input, do: "Bad input! Retry..\n" |> IO.puts
  def tie_game, do: "Tie! Game Over" |> IO.puts
  def win_game(winner), do: "#{winner} wins! Game Over" |> IO.puts

  defp board_cell_string(board, index) do
    case Board.at(board, index) do
      :empty -> index
      value -> value
    end
  end

end
