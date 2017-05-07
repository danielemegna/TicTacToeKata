defmodule Game_Tie_Test do
  use ExUnit.Case

  test "tie raise a Protocol.UndefinedError with a null list" do
    assert_raise Protocol.UndefinedError, fn ->
      evaluate(nil)
    end
  end

  test "tie returns true with an empty list" do
    assert evaluate([]) == true
  end

  test "tie returns false with an empty board" do
    assert evaluate([
      0,1,2,
      3,4,5,
      6,7,8]) == false
  end

  test "tie returns false when board has free spaces!" do
    assert evaluate([
      "X",1,"O",
       3,"O",5,
       6,"X",8]) == false
  end

  test "full tie board returns true" do
    assert evaluate([
      "X","O","X",
      "X","O","X",
      "O","X","O"]) == true
  end

  defp evaluate(board) do
    TicTacToe.Referee.tie?(board)
  end

end
