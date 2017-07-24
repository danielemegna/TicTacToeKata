defmodule TicTacToe.NewBoard_Test do
  use ExUnit.Case
  alias TicTacToe.NewBoard, as: Board

  test 'empty board has free indexes' do
    board = Board.new
    assert Board.free?(board, 0)
    assert Board.free?(board, 1)
    assert Board.free?(board, 5)
    assert Board.free?(board, 8)
  end

  test 'mark board and check free result' do
    board = Board.new

    board = Board.mark(board, 0, "X")
    assert Board.free?(board, 0) == false

    board = Board.mark(board, 2, "O")
    assert Board.free?(board, 2) == false

    assert Board.free?(board, 1)
  end

  test 'get value at index' do
    board = Board.new
    assert Board.at(board, 1) == :empty
    assert Board.at(board, 4) == :empty

    board = Board.mark(board, 1, "X")
    assert Board.at(board, 1) == "X" 
    assert Board.at(board, 4) == :empty
  end

  test 'empty board is not full' do
    assert Board.full?(Board.new) == false
  end

  test 'full board should.. be full' do
    board = Board.new [
      "X","O","X",
      "O","X","O",
      "O","X","O"]

    assert Board.full?(board) == true
  end

  test 'init board with occupied list works properly' do
    board = Board.new [
      "X", 1 ,"X",
      "O", 4 , 5 ,
       6 , 7 ,"O"]

    assert Board.at(board, 1) == :empty
    assert Board.at(board, 2) == "X"
    assert Board.at(board, 5) == :empty
    assert Board.at(board, 8) == "O"
  end

end
