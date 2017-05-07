defmodule Referee_GameOver_Test do
  use ExUnit.Case

  test "game is over with an empty list" do
    assert evaluate([]) == true
  end

  test "game is not over with an empty board" do
    assert evaluate([
      0, 1, 2,
      3, 4, 5,
      6, 7, 8]) == false
  end

  test "full board but no winner" do
    assert evaluate([
      "X","O","X",
      "O","X","O",
      "O","X","O"]) == false
  end

  test "X is the winner" do
    assert evaluate([
      "X","O","X",
      "O","X","O",
       6,  7 ,"X"]) == true
  end

  test "O is the winner" do
    assert evaluate([
      "X","X","O",
      "X","O","X",
      "O", 7,  8]) == true
  end

  defp evaluate(board) do
    TicTacToe.Referee.game_over? board
  end

end
