defmodule TicTacToe.Player.Strategy.Easy_Test do
  use ExUnit.Case
  import TestCommons
  alias TicTacToe.Player

  test "chooses first no gameover move" do
    assert next_move([
       0 , 1,  2,
       3 , 4,  5,
       6 , 7,  8
    ]) == 0
    assert next_move([
       0 , 1,  2,
       3 ,"X", 5,
       6 , 7,  8
    ]) == 0
    assert next_move([
      "O", 1 , 2,
       3 ,"X", 5,
       6 , 7 , 8
    ]) == 1
  end

  test "avoids opponent win moves" do
    assert next_move([
      "O", 1 , 2,
       3 ,"X", 5,
       6 ,"X", 8
    ]) == 2
    assert next_move([
      "O", 1 , 2,
       3 ,"X","O",
      "X","X", 8
    ]) == 3
  end

  test "avoid also win moves!" do
    assert next_move([
      "O","O", 2,
       3 ,"X", 5,
       6 , 7 ,"X"
    ]) == 3
    assert next_move([
      "X","O", 2,
       3 ,"O", 5,
       6 , 7, "X"
    ]) == 2
    assert next_move([
      "X", 1 , 2,
       3 ,"O","X",
       6 ,"O","X"
    ]) == 3
  end

  test "wins only when compelled" do
    assert next_move([
      "O","O", 2,
      "O","X","X",
       6 ,"X","X"
    ]) == 6
  end

  defp next_move(board) do
    Player.Strategy.Easy.next_move(board_from(board), "O")
  end

end
