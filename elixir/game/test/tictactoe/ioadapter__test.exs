defmodule TicTacToe.IOAdapter_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import TestCommons
  alias TicTacToe.IOAdapter
  alias TicTacToe.Board

  test "print an empty board" do
    expected = "\n" <>
      "\n--------------"<>
      "\n"<>
      "\n  0   1   2 "<>
      "\n ===+===+=== "<>
      "\n  3   4   5 "<>
      "\n ===+===+=== "<>
      "\n  6   7   8 "<>
      "\n"<>
      "\n--------------\n\n"

    assert capture_io(fn ->
      IOAdapter.print_board(Board.new)
    end) == expected
  end

  test "print marked board" do
    expected = "\n" <>
      "\n--------------"<>
      "\n"<>
      "\n  X   X   2 "<>
      "\n ===+===+=== "<>
      "\n  3   O   5 "<>
      "\n ===+===+=== "<>
      "\n  X   7   O "<>
      "\n"<>
      "\n--------------\n\n"

    marked_board = board_from [
      "X","X", 2 ,
       3 ,"O", 5 ,
      "X", 7 ,"O"]

    assert capture_io(fn ->
      IOAdapter.print_board(marked_board)
    end) == expected
  end

  test 'print function returns given board' do
    capture_io(fn ->
      board = board_from [0,1,2,"X", 4,5,6,7,"O"]
      assert IOAdapter.print_board(board) == board
    end)
  end


end
