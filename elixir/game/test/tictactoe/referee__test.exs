defmodule TicTacToe.Referee_Test do
  use ExUnit.Case
  alias TicTacToe.Board
  import TestCommons

  test "game is not over with an empty board" do
    assert TicTacToe.Referee.game_over?(Board.new) == {:no, :none}
  end

  test "full board but no winner" do
    assert evaluate_game_over([
      "X","O","X",
      "O","X","O",
      "O","X","O"]) == {:yes, :none}
  end

  test "X is the winner for complete row" do
    assert evaluate_game_over([
      "O","X","O",
      "X","X","X",
       6,  7 ,"O"]) == {:yes, "X"}
  end

  test "O is the winner" do
    assert evaluate_game_over([
      "X","X","O",
      "X","O","X",
      "O", 7,  8]) == {:yes, "O"}
  end

  test "X is the winner and board is full" do
    assert evaluate_game_over([
      "X","O","X",
      "O","X","O",
      "O","X","X"]) == {:yes, "X"}
  end

  test "no winner and free spaces!" do
    assert evaluate_game_over([
      "X",1,"O",
       3,"O",5,
       6,"X",8]) == {:no, :none}
  end

  defp evaluate_game_over(cells) do
    board_from(cells) |> TicTacToe.Referee.game_over?
  end

end
