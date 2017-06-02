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
    assert capture_io(fn ->
      TicTacToe.Referee.announce_or({:yes, "X"}, fn() ->
        flunk("Unexpected continue fn call!")
      end)
    end) == "X wins! Game Over"
  end

  test "announce tie game" do
    assert capture_io(fn ->
      TicTacToe.Referee.announce_or({:yes, :none}, fn() ->
        flunk("Unexpected continue fn call!")
      end)
    end) == "Tie! Game Over"
  end

  test "continue game when it is not over" do
    assert capture_io(fn ->
      TicTacToe.Referee.announce_or({:no, :none}, fn() ->
        IO.write("The game is continuing properly..")
      end)
    end) == "The game is continuing properly.."
  end

  defp evaluate_game_over(board) do
    TicTacToe.Referee.game_over? board
  end

end
