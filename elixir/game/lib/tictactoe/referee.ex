defmodule TicTacToe.Referee do
  alias TicTacToe.Board

  def tie?(board) do
    Board.full?(board)
  end

  def game_over?(board) do
    Board.at(board, 0) == Board.at(board, 1) && Board.at(board, 1) == Board.at(board, 2) ||
    Board.at(board, 3) == Board.at(board, 4) && Board.at(board, 4) == Board.at(board, 5) ||
    Board.at(board, 6) == Board.at(board, 7) && Board.at(board, 7) == Board.at(board, 8) ||
    Board.at(board, 0) == Board.at(board, 3) && Board.at(board, 3) == Board.at(board, 6) ||
    Board.at(board, 1) == Board.at(board, 4) && Board.at(board, 4) == Board.at(board, 7) ||
    Board.at(board, 2) == Board.at(board, 5) && Board.at(board, 5) == Board.at(board, 8) ||
    Board.at(board, 0) == Board.at(board, 4) && Board.at(board, 4) == Board.at(board, 8) ||
    Board.at(board, 2) == Board.at(board, 4) && Board.at(board, 4) == Board.at(board, 6)
  end

end
