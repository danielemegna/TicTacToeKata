defmodule TicTacToe.IOAdapter do

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

  def bad_input do
    "Bad input! Retry..\n" |> IO.puts
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

  def cell_marked(sign, position) do
    "'#{sign}' marked #{position} position" |> IO.puts
  end

end
