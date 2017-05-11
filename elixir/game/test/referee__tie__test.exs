defmodule Game_Tie_Test do
  use ExUnit.Case
  alias TicTacToe.Board

  test "tie returns false with an empty board" do
    assert evaluate(%Board{}) == false
  end

  test "tie returns false when board has free spaces!" do
    assert evaluate(%Board{cells: [
      "X",1,"O",
       3,"O",5,
       6,"X",8]}) == false
  end

  test "full tie board returns true" do
    assert evaluate(%Board{cells: [
      "X","O","X",
      "X","O","X",
      "O","X","O"]}) == true
  end

  defp evaluate(board) do
    TicTacToe.Referee.tie?(board)
  end

end
