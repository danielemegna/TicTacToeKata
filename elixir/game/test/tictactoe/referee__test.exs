defmodule TicTacToe.Referee_Test do
  use ExUnit.Case
  alias TicTacToe.Board

  test "game is not over with an empty board" do
    assert evaluate_game_over(Board.new) == false
  end

  test "full board but no winner" do
    assert evaluate_game_over(%Board{cells: [
      "X","O","X",
      "O","X","O",
      "O","X","O"]}) == true
  end

  test "X is the winner" do
    assert evaluate_game_over(%Board{cells: [
      "X","O","X",
      "O","X","O",
       6,  7 ,"X"]}) == true
  end

  test "O is the winner" do
    assert evaluate_game_over(%Board{cells: [
      "X","X","O",
      "X","O","X",
      "O", 7,  8]}) == true
  end

  test "no winner and free spaces!" do
    assert evaluate_game_over(%Board{cells: [
      "X",1,"O",
       3,"O",5,
       6,"X",8]}) == false
  end

  defp evaluate_game_over(board) do
    TicTacToe.Referee.game_over? board
  end

end
