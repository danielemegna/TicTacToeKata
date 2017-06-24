defmodule Game_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import TestCommons

  test "fast hard game over smoke test" do
    players_choice = [:human_vs_computer, :hard_computer_player]
    game_moves = [0,1,3]

    output = game(players_choice, game_moves)

    assert_contains(output, "Choose game type")
    assert_contains(output, "Enter [1-4]>")
    assert_contains(output, "Choose computer level of difficulty ('O' symbol player)")
    assert_contains(output, "Enter [1-3]>")
    assert_contains(output, "'X' player, choose your next move!")
    assert_contains(output, "Enter [0-8]>")
    assert_contains(output, "0   1   2")
    assert_contains(output, "'X' marked 0 position")
    assert_contains(output, "'O' marked 6 position")
    assert_contains(output, "X   X   O")
    assert_contains(output, "O wins! Game Over")

    assert_not_contains(output, "'O' player, choose your next move!")
    assert_not_contains(output, "Bad input")
    assert_not_contains(output, "already marked")
  end

  test "tie hard game smoke test" do
    players_choice = [:human_vs_computer,:hard_computer_player]
    game_moves = [4,2,3,1,8]

    output = game(players_choice, game_moves)

    assert_contains(output, "X")
    assert_contains(output, "O")
    assert_contains(output, "Tie! Game Over")
  end

  test "wrong inputs and game over smoke test" do
    players_choice = [5,:human_vs_computer,4,"bad",:hard_computer_player]
    game_moves = ["bad",0,4,1,2,5]

    output = game(players_choice, game_moves)

    assert_contains(output, "Bad input! Retry..")
    assert_contains(output, "Cell 4 already marked! Retry..")
    assert_contains(output, "Cell 2 already marked! Retry..")
    assert_contains(output, "O wins! Game Over")
  end

  test "win easy game smoke test" do
    players_choice = [:human_vs_computer,:easy_computer_player]
    game_moves = [6,7,8]

    output = game(players_choice, game_moves)

    assert_contains(output, "X wins! Game Over")
  end

  test "win medium game smoke test" do
    players_choice = [:human_vs_computer,:medium_computer_player]
    game_moves = [6,2,0,3]

    output = game(players_choice, game_moves)

    assert_contains(output, "X wins! Game Over")
  end

  test "human vs human tie game smoke test" do
    players_choice = [:human_vs_human]
    game_moves = [4,0,2,6,3,5,1,7,8]

    output = game(players_choice, game_moves)

    assert_not_contains(output, "Choose computer level of difficulty")
    assert_contains(output, "'X' player, choose your next move!")
    assert_contains(output, "'O' player, choose your next move!")
    assert_contains(output, "Tie! Game Over")
  end

  test "hard computer vs hard computer tie game smoke test" do
    players_choice = [:computer_vs_computer,:hard_computer_player,:hard_computer_player]
    game_moves = []

    output = game(players_choice, game_moves)

    assert_contains(output, "Choose computer level of difficulty ('X' symbol player)")
    assert_contains(output, "Choose computer level of difficulty ('O' symbol player)")
    assert_contains(output, "Tie! Game Over")
    assert_not_contains(output, "Enter [0-8]>")
    assert_not_contains(output, "Bad input! Retry..")
    assert_not_contains(output, "choose your next move")
    assert_not_contains(output, "already marked")
  end

  test "human vs human first player win smoke test" do
    players_choice = [:human_vs_human]
    game_moves = [0,8,6,3,2,4,1]

    output = game(players_choice, game_moves)

    assert_contains(output, "X   X   X")
    assert_contains(output, "X wins! Game Over")
    assert_not_contains(output, "Choose computer level")
  end

  defp game(players_choice, game_moves) do
    input = user_inputs_for(players_choice, game_moves)
    capture_io(input, fn ->
      assert Game.start_game == :ok
    end)
  end

end
