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

  test "O is the winner for complete column" do
    assert evaluate_game_over([
      "O","X","O",
      "X","X","O",
       6,  7 ,"O"]) == {:yes, "O"}
  end

  test "O is the winner for complete diagonal" do
    assert evaluate_game_over([
      "X","X","O",
      "X","O","X",
      "O", 7,  8]) == {:yes, "O"}
  end

  test "winner with full board" do
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

  test "referee support boards with different sizes" do
    assert evaluate_game_over([
      "X" , 1 , 2  , "O",
       4  , 5 , 6  ,  7 ,
       8  , 9 , 10 , 11 ,
       12 ,"X", 14 , "X"
    ]) == {:no, :none}

    assert evaluate_game_over([
      "X" , 1 , 2  , "O",
       4  , 5 , 6  ,  7 ,
      "O" ,"O", 10 , 11 ,
       12 ,"X", "X", "X"
    ]) == {:yes,"X"}

    assert evaluate_game_over([
      "X" , 1 ,"X" , 3 ,
       4  , 5 ,"O" , 7 ,
       8  ,"O", 10 ,11 ,
      "O" ,"X", 14 ,"X"
    ]) == {:yes,"O"}
  end

  defp evaluate_game_over(cells) do
    board_from(cells) |> TicTacToe.Referee.game_over?
  end

end
