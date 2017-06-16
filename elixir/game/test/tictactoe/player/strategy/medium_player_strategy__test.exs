defmodule TicTacToe.Player.Strategy.Medium_Test do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.Player

  test "next_move returns cell 4 if available" do
    assert next_move([
       0 , 1,  2,
       3 , 4,  5,
       6 , 7,  8
    ]) == 4
    assert next_move([
      "X", 1,  2,
       3 , 4,  5,
       6 , 7,  8
    ]) == 4
    assert next_move([
       0 , 1,  2,
       3 , 4, "X",
       6 , 7,  8
    ]) == 4
  end

  test "next_move returns last available cell when 4 is not available and there is no gameover move" do
    assert next_move([
       0 , 1,  2,
       3 ,"X", 5,
       6 , 7,  8
    ]) == 8
    assert next_move([
      "X", 1,  2,
       3 ,"X", 5,
       6 , 7, "O"
    ]) == 7
  end

  test "next_move always returns gameover moves" do
    assert next_move([
      "O", 1, "X",
       3 ,"X", 5,
       6 , 7,  8
    ]) == 6
    assert next_move([
      "O", 1, "X",
      "X","X", 5,
      "O", 7,  8
    ]) == 5
  end

  test "to_str function describes the strategy" do
    assert Player.Strategy.Medium.to_str == "Medium computer"
  end

  defp next_move(board) do
    Player.Strategy.Medium.next_move(%Board{cells: board}, "O")
  end

end
