defmodule Board_Test do
  use ExUnit.Case
  alias TicTacToe.Board

  test 'empty board has free indexes' do
    board = %Board{}
    assert Board.free?(board, 0)
    assert Board.free?(board, 1)
    assert Board.free?(board, 5)
    assert Board.free?(board, 8)
  end

  test 'mark board and check free result' do
    board = %Board{}

    board = Board.mark(board, 0, "X")
    assert Board.free?(board, 0) == false

    board = Board.mark(board, 2, "O")
    assert Board.free?(board, 2) == false
  end

  test 'get value at index' do
    board = %Board{}
    assert Board.at(board, 0) == 0
    assert Board.at(board, 2) == 2

    board = Board.mark(board, 0, "X")
    assert Board.at(board, 0) == "X" 
    assert Board.at(board, 2) == 2
  end

end
