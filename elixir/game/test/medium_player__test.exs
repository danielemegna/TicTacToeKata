defmodule MediumPlayer_Test do
  use ExUnit.Case

  test "next_move returns cell 4 if available" do
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

  defp next_move(board) do
    TicTacToe.MediumPlayer.next_move(board)
  end

end
