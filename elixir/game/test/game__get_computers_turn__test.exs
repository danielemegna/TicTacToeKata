defmodule Game_GetComputersTurn_Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "get_computers_turn marks cell 4 if available" do
    get_computers_turn([
      "X", 1,  2,
       3 , 4,  5,
       6 , 7,  8
    ])
    assert_received {:new_board, [
      "X", 1,  2,
       3 ,"O", 5,
       6 , 7,  8
    ]}
    get_computers_turn([
       0 , 1,  2,
       3 , 4, "X",
       6 , 7,  8
    ])
    assert_received {:new_board, [
       0 , 1,  2,
       3 ,"O","X",
       6 , 7,  8
    ]}
  end

  test "get_computers_turn marks last available cell when 4 is not available and there is no gameover move" do
    get_computers_turn([
       0 , 1,  2,
       3 ,"X", 5,
       6 , 7,  8
    ])
    assert_received {:new_board, [
       0 , 1,  2,
       3 ,"X", 5,
       6 , 7, "O"
    ]}
    get_computers_turn([
      "X", 1,  2,
       3 ,"X", 5,
       6 , 7, "O"
    ])
    assert_received {:new_board, [
      "X", 1,  2,
       3 ,"X", 5,
       6 ,"O","O"
    ]}
  end

  test "get_computers_turn always marks gameover moves" do
    get_computers_turn([
      "O", 1, "X",
       3 ,"X", 5,
       6 , 7,  8
    ])
    assert_received {:new_board, [
      "O", 1, "X",
       3 ,"X", 5,
      "O", 7,  8
    ]}
    get_computers_turn([
      "O", 1, "X",
      "X","X", 5,
      "O", 7,  8
    ])
    assert_received {:new_board, [
      "O", 1, "X",
      "X","X","O",
      "O", 7,  8
    ]}
  end


  defp get_computers_turn(board) do
    capture_io(fn ->
      new_board = Game.get_computers_turn(board)
      send self(), {:new_board, new_board}
    end)
  end

end
