defmodule TicTacToe.Player.Strategy.Human_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Board
  alias TicTacToe.Player

  test "mark first cell" do
    user_choice = "0"
    next_move(%Board{}, user_choice)
    assert_received {:chosen_move, 0}
  end

  test "trying to mark a marked cell, player can choose another one" do
    user_choices = "0\n" <> "3\n" <> "4"
    next_move(%Board{cells: [
      "O", 1 , 2,
      "X", 4 , 5,
       6 , 7 , 8
    ]}, user_choices)
    assert_received {:chosen_move, 4}
  end

  defp next_move(board, input) do
    capture_io([input: input], fn ->
      chosen_move = Player.Strategy.Human.next_move(board)
      send self(), {:chosen_move, chosen_move}
    end)
  end
end
