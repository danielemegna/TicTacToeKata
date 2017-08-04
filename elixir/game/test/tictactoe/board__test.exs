defmodule TicTacToe.Board_Test do
  use ExUnit.Case
  import TestCommons
  alias TicTacToe.Board

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

  test 'get value at row-column coordinates' do
    board = board_from [
      "X", 1 ,"X",
      "O", 4 , 5 ,
       6 , 7 ,"O"]

    assert Board.at(board, 0, 0) == "X"
    assert Board.at(board, 0, 1) == :empty
    assert Board.at(board, 1, 1) == :empty
    assert Board.at(board, 2, 2) == "O"
  end

  test 'empty board is not full' do
    assert Board.full?(Board.new) == false
  end

  test 'full board should.. be full' do
    board = board_from [
      "X","O","X",
      "O","X","O",
      "O","X","O"]

    assert Board.full?(board) == true
  end

  test 'init board with occupied list works properly' do
    board = board_from [
      "X", 1 ,"X",
      "O", 4 , 5 ,
       6 , 7 ,"O"]

    assert Board.at(board, 1) == :empty
    assert Board.at(board, 2) == "X"
    assert Board.at(board, 5) == :empty
    assert Board.at(board, 8) == "O"
  end

  test 'available moves of empty board' do
    assert Board.available_moves(Board.new) == [0,1,2,3,4,5,6,7,8]
  end

  test 'available moves of full board' do
    board = board_from [
      "X","O","X",
      "O","X","O",
      "O","X","O"]

    assert Board.available_moves(board) == []
  end

  test 'available moves of marked board' do
    board = Board.new
      |> Board.mark(0, "X")
      |> Board.mark(2, "O")
      |> Board.mark(4, "X")

    assert Board.available_moves(board) == [1,3,5,6,7,8]

    board = board_from [
      "X","O","X",
      "O", 4 ,"O",
       6 ,"X", 8 ]

    assert Board.available_moves(board) == [4,6,8]
  end

  test 'get row' do
    board = board_from [
      "X","O","X",
      "O", 4 ,"O",
       6 , 7 , 8 ]

    assert Board.row(board, 0) == ["X","O","X"]
    assert Board.row(board, 1) == ["O",:empty,"O"]
    assert Board.row(board, 2) == [:empty,:empty,:empty]
  end
  
  test 'get row of a 4x4 board' do
    board = board_from [
      "X" , 1 , 2  , "O",
       4  , 5 , 6  ,  7 ,
       8  , 9 , 10 , 11 ,
       12 ,"X", 14 , "X"
    ]

    assert Board.row(board, 0) == ["X",:empty,:empty,"O"]
    assert Board.row(board, 1) == [:empty,:empty,:empty,:empty]
    assert Board.row(board, 3) == [:empty,"X",:empty,"X"]
  end

  test 'get column' do
    board = board_from [
      "X", 1 , 2 ,
      "O","X", 5 ,
       6 ,"O", 8 ]

    assert Board.column(board, 0) == ["X","O",:empty]
    assert Board.column(board, 1) == [:empty,"X","O"]
    assert Board.column(board, 2) == [:empty,:empty,:empty]
  end

  test 'get column of a 5x5 board' do
    board = board_from [
      "X" , 1  , 2  , "O", "O",
       5  , 6  , 7  , 8  , "X",
       10 , 11 , 12 , 13 , "X",
       15 , "X", 17 , "X", "O",
      "O" , 21 , 22 , 23 , "O",
    ]

    assert Board.column(board, 0) == ["X",:empty,:empty,:empty,"O"]
    assert Board.column(board, 2) == [:empty,:empty,:empty,:empty,:empty]
    assert Board.column(board, 4) == ["O","X","X","O","O"]
  end

  test 'get down diagonal' do
    board = board_from [
      "X", 1 , 2 ,
       3 ,"O", 5 ,
      "O","X", 8 ]
    assert Board.diagonal(board, 0, :down) == ["X","O",:empty]
    assert Board.diagonal(board, 1, :down) == [:empty,"X"]
    assert Board.diagonal(board, 2, :down) == ["O"]
    
    board = board_from [
      "X" , 1 , 2  , "O",
       4  , 5 , 6  ,  7 ,
       8  , 9 , 10 , 11 ,
       12 ,"X", 14 , "X"
    ]
    assert Board.diagonal(board, 0, :down) == ["X",:empty,:empty,"X"]
    assert Board.diagonal(board, 2, :down) == [:empty,"X"]
    assert Board.diagonal(board, 3, :down) == [:empty]
  end

  test 'get up diagonal' do
    board = board_from [
      "X", 1 , 2 ,
       3 ,"O", 5 ,
      "O","X", 8 ]
    assert Board.diagonal(board, 0, :up) == ["X"]
    assert Board.diagonal(board, 1, :up) == [:empty,:empty]
    assert Board.diagonal(board, 2, :up) == ["O","O",:empty]

    board = board_from [
      "X" , 1 , 2  , "O",
       4  , 5 , 6  ,  7 ,
       8  , 9 , 10 , 11 ,
       12 ,"X", 14 , "X"
    ]
    assert Board.diagonal(board, 0, :up) == ["X"]
    assert Board.diagonal(board, 2, :up) == [:empty,:empty,:empty]
    assert Board.diagonal(board, 3, :up) == [:empty,:empty,:empty,"O"]
  end

  test 'get board last_index' do
    assert Board.last_index(Board.new) == 8
    assert Board.last_index(Board.new(4)) == 15
    assert Board.last_index(Board.new(2)) == 3
  end

  test 'check outbound index free should raise an error' do
    assert_raise(ArgumentError, "Out of board bound error", fn ->
      Board.free?(Board.new, 11)
    end)
    assert_raise(ArgumentError, "Out of board bound error", fn ->
      Board.free?(Board.new, -2)
    end)
  end

  test 'mark value at outbound index should raise an error' do
    assert_raise(ArgumentError, "Out of board bound error", fn ->
      Board.mark(Board.new, 14, "X")
    end)
  end

  test 'get value at outbound index should raise an error' do
    assert_raise(ArgumentError, "Out of board bound error", fn ->
      Board.at(Board.new, 9)
    end)
  end

  test 'get outbound row should raise an error' do
    assert_raise(ArgumentError, "Out of board bound error", fn ->
      Board.row(Board.new, 3)
    end)
  end

  test 'get outbound diagonal should raise an error' do
    assert_raise(ArgumentError, "Out of board bound error", fn ->
      Board.diagonal(Board.new, -1, :down)
    end)
  end

end
