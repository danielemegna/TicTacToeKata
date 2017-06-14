defmodule Game_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @human_vs_computer 3
  @hard_computer_player 3

  test "fast game over smoke test" do
    players_choice = [@human_vs_computer,@hard_computer_player]
    game_moves = [0,1,3]
    user_inputs = players_choice ++ game_moves

    output = game(user_inputs)

    assert_contains(output, "Choose game type")
    assert_contains(output, "Choose computer level of difficulty")
    assert_contains(output, "Enter [1-3]>")
    assert_contains(output, "Enter [0-8]>")
    assert_contains(output, "X")
    assert_contains(output, "O wins! Game Over")
  end

  test "tie game smoke test" do
    players_choice = [@human_vs_computer,@hard_computer_player]
    game_moves = [4,2,3,1,8]
    user_inputs = players_choice ++ game_moves

    output = game(user_inputs)

    assert_contains(output, "X")
    assert_contains(output, "O")
    assert_contains(output, "Tie! Game Over")
  end

  test "wrong inputs smoke test" do
    players_choice = [5,@human_vs_computer,4,"bad",@hard_computer_player]
    game_moves = ["bad",0,4,1,2,5]
    user_inputs = players_choice ++ game_moves

    output = game(user_inputs)

    assert_contains(output, "Bad input! Retry..")
    assert_contains(output, "Cell 4 already marked! Retry..")
    assert_contains(output, "Cell 2 already marked! Retry..")
    assert_contains(output, "O wins! Game Over")
  end

  defp game(user_inputs) do
    input = Enum.join(user_inputs, "\n")
    capture_io(input, fn ->
      assert Game.start_game == :ok
    end)
  end

  defp assert_contains(string, substring) do
    assert String.contains?(string, substring),
      "Expected #{inspect string} to contain #{inspect substring}"
  end

end
