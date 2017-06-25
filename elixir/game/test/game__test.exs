defmodule Game_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import TestCommons

  test "fast hard game over smoke test" do
    players_choice = [:human_vs_computer, :hard_computer_player]
    game_moves = [0,1,3]

    output = game(players_choice, game_moves)

    assert_contains(output,[
      "Choose game type",
      "Enter [1-4]>",
      "Choose computer level of difficulty ('O' symbol player)",
      "Enter [1-3]>",
      "'X' player, choose your next move!",
      "Enter [0-8]>",
      "0   1   2",
      "'X' marked 0 position",
      "'O' marked 6 position",
      "X   X   O",
      "O wins! Game Over"
    ])

    assert_not_contains(output,[
      "'O' player, choose your next move!",
      "Bad input",
      "already marked"
    ])
  end

  test "tie hard game smoke test" do
    players_choice = [:human_vs_computer,:hard_computer_player]
    game_moves = [4,2,3,1,8]

    output = game(players_choice, game_moves)

    assert_contains(output, ["X","O","Tie! Game Over"])
  end

  test "wrong inputs and game over smoke test" do
    players_choice = [5,:human_vs_computer,4,"bad",:hard_computer_player]
    game_moves = ["bad",0,4,1,2,5]

    output = game(players_choice, game_moves)

    assert_contains(output,[
      "Bad input! Retry..",
      "Cell 4 already marked! Retry..",
      "Cell 2 already marked! Retry..",
      "O wins! Game Over"
    ])
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

    assert_contains(output,[
      "'X' player, choose your next move!",
      "'O' player, choose your next move!",
      "Tie! Game Over"
    ])
    assert_not_contains(output, "Choose computer level of difficulty")
  end

  test "hard computer vs hard computer tie game smoke test" do
    players_choice = [:computer_vs_computer,:hard_computer_player,:hard_computer_player]
    game_moves = []

    output = game(players_choice, game_moves)

    assert_contains(output,[
      "Choose computer level of difficulty ('X' symbol player)",
      "Choose computer level of difficulty ('O' symbol player)",
      "Tie! Game Over"
    ])
    assert_not_contains(output,[
      "Enter [0-8]>",
      "Bad input! Retry..",
      "choose your next move",
      "already marked"
    ])
  end

  test "human vs human first player win smoke test" do
    players_choice = [:human_vs_human]
    game_moves = [0,8,6,3,2,4,1]

    output = game(players_choice, game_moves)

    assert_contains(output, ["X   X   X", "X wins! Game Over"])
    assert_not_contains(output, "Choose computer level")
  end

  defp game(players_choice, game_moves) do
    input = user_inputs_for(players_choice ++ game_moves)
    capture_io(input, fn ->
      assert Game.start_game == :ok
    end)
  end

end
