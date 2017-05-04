defmodule Game_GetHumansTurn_Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "get_humans_turn and mark first cell" do
    get_humans_turn([0,1,2,3,4,5,6,7,8], "0")
    assert_received {:new_board, ["X",1,2,3,4,5,6,7,8]}
  end

  test "trying to mark a marked cell, player can choose another one" do
    get_humans_turn(["O",1,2,3,4,5,6,7,8], "0\n" <> "1")
    assert_received {:new_board, ["O","X",2,3,4,5,6,7,8]}
  end

  defp get_humans_turn(board, input) do
    capture_io([input: input], fn ->
      new_board = Game.get_humans_turn(board)
      send self(), {:new_board, new_board}
    end)
  end
end
