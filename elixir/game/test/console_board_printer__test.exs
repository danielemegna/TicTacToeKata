defmodule ConsoleBoardPrinter_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.ConsoleBoardPrinter
  alias TicTacToe.Board

  test "print an empty board" do
    expected =
      "\n--------------"<>
      "\n"<>
      "\n  0   1   2"<>
      "\n ===+===+=== "<>
      "\n  3   4   5"<>
      "\n ===+===+=== "<>
      "\n  6   7   8"<>
      "\n"<>
      "\n--------------\n\n"

    assert capture_io(fn ->
      ConsoleBoardPrinter.print(%Board{})
    end) == expected
  end

  test "print marked board" do
    expected =
      "\n--------------"<>
      "\n"<>
      "\n  X   X   2"<>
      "\n ===+===+=== "<>
      "\n  3   O   5"<>
      "\n ===+===+=== "<>
      "\n  X   7   O"<>
      "\n"<>
      "\n--------------\n\n"

    marked_board = %Board{cells: [
      "X","X", 2 ,
       3 ,"O", 5 ,
      "X", 7 ,"O"]}

    assert capture_io(fn ->
      ConsoleBoardPrinter.print(marked_board)
    end) == expected
  end
end
