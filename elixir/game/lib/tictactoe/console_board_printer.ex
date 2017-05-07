defmodule TicTacToe.ConsoleBoardPrinter do

  def print(board) do
    IO.write("\n--------------\n\n")
    IO.write("  #{Enum.at(board, 0)}   #{Enum.at(board, 1)}   #{Enum.at(board, 2)}\n ===+===+=== \n  #{Enum.at(board, 3)}   #{Enum.at(board, 4)}   #{Enum.at(board, 5)}\n ===+===+=== \n  #{Enum.at(board, 6)}   #{Enum.at(board, 7)}   #{Enum.at(board, 8)}\n")
    IO.write("\n--------------\n\n")
  end

end
