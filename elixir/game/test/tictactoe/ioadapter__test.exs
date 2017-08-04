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
    marked_board = board_from [
      "X","X", 2 ,
       3 ,"O", 5 ,
      "X", 7 ,"O"]

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

    assert capture_io(fn ->
      IOAdapter.print_board(marked_board)
    end) == expected
  end

  test "print 4x4 board" do
    board = board_from [
      "X","X", 2 , 3 ,
       4 ,"O", 6 , 7 ,
      "X", 9 ,"O", 11,
       12,"O","X", 15]

    expected = "\n" <>
      "\n------------------"<>
      "\n"<>
      "\n  X   X   2   3 "<>
      "\n ===+===+===+=== "<>
      "\n  4   O   6   7 "<>
      "\n ===+===+===+=== "<>
      "\n  X   9   O   11"<>
      "\n ===+===+===+=== "<>
      "\n  12  O   X   15"<>
      "\n"<>
      "\n------------------\n\n"

    assert capture_io(fn ->
      IOAdapter.print_board(board)
    end) == expected
    
  end

  test 'print function returns given board' do
    capture_io(fn ->
      board = board_from [0,1,2,"X",4,5,6,7,"O"]
      assert IOAdapter.print_board(board) == board
    end)
  end

  test 'next_move should parse choosen index properly' do
    capture_io("4", fn ->
      assert IOAdapter.next_move?("X", 8) == {4, ""}
    end)
  end

  test 'next_move should prints sign turn' do
    current_sign = "X"
    output = next_move?(current_sign, 8)
    assert_contains output, "'X' player, choose your next move"
  end

  test 'next_move should prints indexes range' do
    board_last_index = 8
    output = next_move?("X", board_last_index)
    assert_contains output, "Enter [0-8]"

    board_last_index = 15
    output = next_move?("X", board_last_index)
    assert_contains output, "Enter [0-15]"
  end

  defp next_move?(current_sign, board_last_index) do
    capture_io("42", fn ->
      IOAdapter.next_move?(current_sign, board_last_index)
    end)
  end

end
