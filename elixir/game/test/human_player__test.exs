defmodule HumanPlayer_Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "mark first cell" do
    next_move([0,1,2,3,4,5,6,7,8], "0")
    assert_received {:move, 0}
  end

  test "trying to mark a marked cell, player can choose another one" do
    next_move(["O",1,2,"X",4,5,6,7,8], "0\n" <> "3\n" <> "4")
    assert_received {:move, 4}
  end

  defp next_move(board, input) do
    capture_io([input: input], fn ->
      move = TicTacToe.HumanPlayer.next_move(board)
      send self(), {:move, move}
    end)
  end
end
