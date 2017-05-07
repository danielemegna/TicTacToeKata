defmodule TicTacToe.Referee do

  def game_over?(board) do
    Enum.at(board, 0) == Enum.at(board, 1) && Enum.at(board, 1) == Enum.at(board, 2) ||
    Enum.at(board, 3) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 5) ||
    Enum.at(board, 6) == Enum.at(board, 7) && Enum.at(board, 7) == Enum.at(board, 8) ||
    Enum.at(board, 0) == Enum.at(board, 3) && Enum.at(board, 3) == Enum.at(board, 6) ||
    Enum.at(board, 1) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 7) ||
    Enum.at(board, 2) == Enum.at(board, 5) && Enum.at(board, 5) == Enum.at(board, 8) ||
    Enum.at(board, 0) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 8) ||
    Enum.at(board, 2) == Enum.at(board, 4) && Enum.at(board, 4) == Enum.at(board, 6)
  end

end
