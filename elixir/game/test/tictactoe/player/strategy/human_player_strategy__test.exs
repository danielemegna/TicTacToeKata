defmodule TicTacToe.Player.Strategy.Human_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import TestCommons
  alias TicTacToe.Board
  alias TicTacToe.Player

  test "mark first cell" do
    board = Board.new
    user_choice = ["0"]
    expected = 0

    output = next_move(board, user_choice, expected)

    assert output ==
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"
  end

  test "on bad user input player can retry" do
    board = Board.new
    user_choices = ["bad", "6"]
    expected = 6

    output = next_move(board, user_choices, expected)

    assert output ==
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"<>
      "Bad input! Retry..\n\n"<>
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"
  end

  test "on index out of board player can retry" do
    board = Board.new
    user_choices = [9,11,-1,5]
    expected = 5

    output = next_move(board, user_choices, expected)

    assert output ==
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"<>
      "Bad input! Retry..\n\n"<>
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"<>
      "Bad input! Retry..\n\n"<>
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"<>
      "Bad input! Retry..\n\n"<>
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"
  end

  test "on already marked cell player can retry" do
    board = Board.new [
      "O", 1 , 2,
      "X", 4 , 5,
       6 , 7 , 8
    ]
    user_choices = [0,3,4]
    expected = 4

    output = next_move(board, user_choices, expected)

    assert output ==
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"<>
      "Cell 0 already marked! Retry..\n\n"<>
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"<>
      "Cell 3 already marked! Retry..\n\n"<>
      "'X' player, choose your next move!\n"<>
      "Enter [0-8]>"
  end

  defp next_move(board, choices, expected_move) do
    input = user_inputs_for(choices)
    capture_io(input, fn ->
      chosen_move = Player.Strategy.Human.next_move(board, "X")
      assert expected_move == chosen_move
    end)
  end
end
