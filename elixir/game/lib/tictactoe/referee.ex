defmodule TicTacToe.Referee do
  alias TicTacToe.Board

  def game_over?(board) do
    tie?(board) || there_is_a_winner?(board)
  end

  defp there_is_a_winner?(board) do
    Board.at(board, 0) == Board.at(board, 1) && Board.at(board, 1) == Board.at(board, 2) ||
    Board.at(board, 3) == Board.at(board, 4) && Board.at(board, 4) == Board.at(board, 5) ||
    Board.at(board, 6) == Board.at(board, 7) && Board.at(board, 7) == Board.at(board, 8) ||
    Board.at(board, 0) == Board.at(board, 3) && Board.at(board, 3) == Board.at(board, 6) ||
    Board.at(board, 1) == Board.at(board, 4) && Board.at(board, 4) == Board.at(board, 7) ||
    Board.at(board, 2) == Board.at(board, 5) && Board.at(board, 5) == Board.at(board, 8) ||
    Board.at(board, 0) == Board.at(board, 4) && Board.at(board, 4) == Board.at(board, 8) ||
    Board.at(board, 2) == Board.at(board, 4) && Board.at(board, 4) == Board.at(board, 6)
  end

  defp tie?(board) do
    Board.full?(board)
  end


end
