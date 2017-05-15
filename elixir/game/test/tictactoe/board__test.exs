defmodule TicTacToe.Board_Test do
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

  test 'empty board is not full' do
    assert Board.full?(%Board{}) == false
  end

  test 'not full marked board should.. not be full' do
    board = %Board{}
      |> Board.mark(0, "X")
      |> Board.mark(2, "O")
      |> Board.mark(4, "X")

    assert Board.full?(board) == false
  end

  test 'full board should.. be full' do
    board = %Board{cells: [
      "X","O","X",
      "O","X","O",
      "O","X","O"]}

    assert Board.full?(board) == true
  end

  test 'available moves of empty board' do
    assert Board.available_moves(%Board{}) == [0,1,2,3,4,5,6,7,8]
  end

  test 'available moves of full board' do
    board = %Board{cells: [
      "X","O","X",
      "O","X","O",
      "O","X","O"]}

    assert Board.available_moves(board) == []
  end

  test 'available moves of marked board' do
    board = %Board{}
      |> Board.mark(0, "X")
      |> Board.mark(2, "O")
      |> Board.mark(4, "X")

    assert Board.available_moves(board) == [1,3,5,6,7,8]
  end

end