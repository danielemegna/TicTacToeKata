defmodule Game_PrintBoard_Test do
  use ExUnit.Case
  doctest Game

  import ExUnit.CaptureIO

  test "print board with an empty list" do
    expected =
      "\n--------------"<>
      "\n"<>
      "\n        "<>
      "\n ===+===+=== "<>
      "\n        "<>
      "\n ===+===+=== "<>
      "\n        "<>
      "\n"<>
      "\n--------------\n\n"

    assert capture_io(fn ->
      Game.print_board([])
    end) == expected
  end

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
      Game.print_board([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end) == expected
  end
end
