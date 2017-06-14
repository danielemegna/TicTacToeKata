defmodule Game_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @human_vs_human 1
  @human_vs_computer 3
  
  @easy_computer_player 1
  @medium_computer_player 2
  @hard_computer_player 3

  test "fast hard game over smoke test" do
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

    assert_not_contains(output, "Bad input! Retry..")
    assert_not_contains(output, "already marked")
  end

  test "tie hard game smoke test" do
    players_choice = [@human_vs_computer,@hard_computer_player]
    game_moves = [4,2,3,1,8]
    user_inputs = players_choice ++ game_moves

    output = game(user_inputs)

    assert_contains(output, "X")
    assert_contains(output, "O")
    assert_contains(output, "Tie! Game Over")
  end

  test "wrong inputs and game over smoke test" do
    players_choice = [5,@human_vs_computer,4,"bad",@hard_computer_player]
    game_moves = ["bad",0,4,1,2,5]
    user_inputs = players_choice ++ game_moves

    output = game(user_inputs)

    assert_contains(output, "Bad input! Retry..")
    assert_contains(output, "Cell 4 already marked! Retry..")
    assert_contains(output, "Cell 2 already marked! Retry..")
    assert_contains(output, "O wins! Game Over")
  end

  test "win easy game smoke test" do
    players_choice = [@human_vs_computer,@easy_computer_player]
    game_moves = [6,7,8]
    user_inputs = players_choice ++ game_moves

    output = game(user_inputs)

    assert_contains(output, "X wins! Game Over")
  end

  test "win medium game smoke test" do
    players_choice = [@human_vs_computer,@medium_computer_player]
    game_moves = [6,2,0,3]
    user_inputs = players_choice ++ game_moves

    output = game(user_inputs)

    assert_contains(output, "X wins! Game Over")
  end

  test "human vs human tie game smoke test" do
    players_choice = [@human_vs_human]
    game_moves = [4,0,2,6,3,5,1,7,8]
    user_inputs = players_choice ++ game_moves

    output = game(user_inputs)

    assert_not_contains(output, "Choose computer level of difficulty")
    assert_contains(output, "Tie! Game Over")
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
  defp assert_not_contains(string, substring) do
    assert !String.contains?(string, substring),
      "Expected #{inspect string} to NOT contain #{inspect substring}"
  end

end
