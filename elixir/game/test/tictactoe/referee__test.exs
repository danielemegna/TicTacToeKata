defmodule TicTacToe.Referee_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Board

  test "game is not over with an empty board" do
    assert evaluate_game_over(Board.new) == {:no, :none}
  end

  test "full board but no winner" do
    assert evaluate_game_over(%Board{cells: [
      "X","O","X",
      "O","X","O",
      "O","X","O"]}) == {:yes, :none}
  end

  test "X is the winner" do
    assert evaluate_game_over(%Board{cells: [
      "X","O","X",
      "O","X","O",
       6,  7 ,"X"]}) == {:yes, "X"}
  end

  test "O is the winner" do
    assert evaluate_game_over(%Board{cells: [
      "X","X","O",
      "X","O","X",
      "O", 7,  8]}) == {:yes, "O"}
  end

  test "X is the winner and board is full" do
    assert evaluate_game_over(%Board{cells: [
      "X","O","X",
      "O","X","O",
      "O","X","X"]}) == {:yes, "X"}
  end

  test "no winner and free spaces!" do
    assert evaluate_game_over(%Board{cells: [
      "X",1,"O",
       3,"O",5,
       6,"X",8]}) == {:no, :none}
  end

  test "announce X winner" do
    assert evaluate_announce_or({:yes, "X"})
      == "X wins! Game Over"
  end

  test "announce tie game" do
    assert evaluate_announce_or({:yes, :none})
      == "Tie! Game Over"
  end

  test "continue game when it is not over" do
    continue_write = "The game is continuing properly.."
    assert evaluate_announce_or({:no, :none}, fn() ->
      IO.write(continue_write)
    end) == continue_write
  end

  defp evaluate_game_over(board) do
    TicTacToe.Referee.game_over? board
  end

  defp evaluate_announce_or(game_over?) do
    evaluate_announce_or(game_over?, fn() ->
      flunk("Unexpected continue fn call!")
    end)
  end

  defp evaluate_announce_or(game_over?, continuefn) do
    capture_io(fn ->
      TicTacToe.Referee.announce_or(game_over?, continuefn)
    end)
  end

end
