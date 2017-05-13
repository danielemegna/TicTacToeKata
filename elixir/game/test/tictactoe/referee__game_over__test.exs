defmodule TicTacToe.Referee_GameOver_Test do
  use ExUnit.Case
  alias TicTacToe.Board

  test "game is not over with an empty board" do
    assert evaluate(%Board{}) == false
  end

  test "full board but no winner" do
    assert evaluate(%Board{cells: [
      "X","O","X",
      "O","X","O",
      "O","X","O"]}) == false
  end

  test "X is the winner" do
    assert evaluate(%Board{cells: [
      "X","O","X",
      "O","X","O",
       6,  7 ,"X"]}) == true
  end

  test "O is the winner" do
    assert evaluate(%Board{cells: [
      "X","X","O",
      "X","O","X",
      "O", 7,  8]}) == true
  end

  defp evaluate(board) do
    TicTacToe.Referee.game_over? board
  end

end
