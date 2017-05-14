defmodule TicTacToe.ConsoleBoardPrinter do
  alias TicTacToe.Board

  def print(board) do
    IO.write("\n--------------\n\n")
    IO.write("  #{Board.at(board, 0)}   ")
    IO.write("#{Board.at(board, 1)}   ")
    IO.write("#{Board.at(board, 2)}")
    IO.write("\n ===+===+=== \n  ")
    IO.write("#{Board.at(board, 3)}   ")
    IO.write("#{Board.at(board, 4)}   ")
    IO.write("#{Board.at(board, 5)}")
    IO.write("\n ===+===+=== \n  ")
    IO.write("#{Board.at(board, 6)}   ")
    IO.write("#{Board.at(board, 7)}   ")
    IO.write("#{Board.at(board, 8)}\n")
    IO.write("\n--------------\n\n")
    board
  end

end
