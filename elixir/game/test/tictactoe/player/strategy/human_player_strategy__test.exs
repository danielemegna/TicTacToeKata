defmodule TicTacToe.Player.Strategy.Human_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Board
  alias TicTacToe.Player

  test "mark first cell" do
    board = Board.new
    user_choice = "0"

    assert next_move(board, user_choice) == "Enter [0-8]>"
    assert_received {:chosen_move, 0}
  end

  test "bad user input" do
    board = Board.new
    user_choices = "bad\n" <> "6"

    assert next_move(board, user_choices) ==
      "Enter [0-8]>"<>
      "Bad input! Retry..\n"<>
      "Enter [0-8]>"
    assert_received {:chosen_move, 6}
  end

  test "move index out of board" do
    board = Board.new
    user_choices = "9\n" <> "11\n" <> "-1\n" <> "5"

    assert next_move(board, user_choices) ==
      "Enter [0-8]>"<>
      "Bad input! Retry..\n"<>
      "Enter [0-8]>"<>
      "Bad input! Retry..\n"<>
      "Enter [0-8]>"<>
      "Bad input! Retry..\n"<>
      "Enter [0-8]>"
    assert_received {:chosen_move, 5}
  end

  test "trying to mark a marked cell, player can choose another one" do
    board = %Board{cells: [
      "O", 1 , 2,
      "X", 4 , 5,
       6 , 7 , 8
    ]}
    user_choices =
      "0\n"<>
      "3\n"<>
      "4"

    assert next_move(board, user_choices) ==
      "Enter [0-8]>"<>
      "Cell 0 already marked! Retry..\n"<>
      "Enter [0-8]>"<>
      "Cell 3 already marked! Retry..\n"<>
      "Enter [0-8]>"
    assert_received {:chosen_move, 4}
  end

  defp next_move(board, input) do
    capture_io(input, fn ->
      chosen_move = Player.Strategy.Human.next_move(board, "X")
      send self(), {:chosen_move, chosen_move}
    end)
  end
end
