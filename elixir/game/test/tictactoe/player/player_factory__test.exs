defmodule TicTacToe.PlayerFactory_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Player
  alias TicTacToe.PlayerFactory

  @valid_human_vs_computer [
    :human_vs_computer,
    :medium_computer_player,
    :first_player_before
  ]

  test 'human vs human choosen' do
    assert_pair([:human_vs_human,:first_player_before], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Human },
    ])
  end

  test 'medium computer vs hard computer choosen' do
    user_input = [
      :computer_vs_computer,:medium_computer_player,
      :hard_computer_player,:first_player_before
    ]
    assert_pair(user_input, [
      %Player{ sign: "X", strategy: Player.Strategy.Medium },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'human vs hard player choosen' do
    assert_pair([:human_vs_computer,:hard_computer_player,:first_player_before], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'human vs easy player choosen' do
    assert_pair([:human_vs_computer,:easy_computer_player,:first_player_before], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Easy },
    ])
  end

  test 'human vs medium player choosen' do
    assert_pair([:human_vs_computer,:medium_computer_player,:first_player_before], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Medium },
    ])
  end

  test 'human vs hard player and computer first choosen' do
    assert_pair([:human_vs_computer,:hard_computer_player,:second_player_before], [
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
      %Player{ sign: "X", strategy: Player.Strategy.Human },
    ])
  end

  test 'bad input provided' do
    output = assert_pair(["bad",:human_vs_computer,5,:hard_computer_player,3,:first_player_before], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
    assert_contains(output, "Bad input! Retry..")
  end

  test 'pair writes out menu to choose game type' do
    valid_user_inputs = TestCommons.user_inputs_for(@valid_human_vs_computer)
    output = capture_io(valid_user_inputs, fn ->
      PlayerFactory.pair
    end)

    assert_contains(output,
      "Choose game type\n"<>
      " 1. Human v. Human\n"<>
      " 2. Computer v. Computer\n"<>
      " 3. Human v. Computer\n"<>
      "Enter [1-3]>")
  end

  test 'pair writes out menu to choose the difficulty' do
    valid_user_inputs = TestCommons.user_inputs_for(@valid_human_vs_computer)
    output = capture_io(valid_user_inputs, fn ->
      PlayerFactory.pair
    end)

    assert_contains(output,
      "Choose computer level of difficulty\n"<>
      " 1. Easy\n"<>
      " 2. Medium\n"<>
      " 3. Hard (unbeatable)\n"<>
      "Enter [1-3]>")
  end

  test 'pair writes out menu to choose players order' do
    valid_user_inputs = TestCommons.user_inputs_for(@valid_human_vs_computer)
    output = capture_io(valid_user_inputs, fn ->
      PlayerFactory.pair
    end)

    assert_contains(output,
      "Who go first?\n"<>
      " 1. Human player (X)\n"<>
      " 2. Medium computer player (O)\n"<>
      "Enter [1-2]>")
  end

  defp assert_pair(user_input, expected) do
    input = TestCommons.user_inputs_for(user_input)
    capture_io(input, fn ->
      assert PlayerFactory.pair == expected
    end)
  end

  defp assert_contains(string, substring) do
    assert String.contains?(string, substring),
      "Expected #{inspect string} to contain #{inspect substring}"
  end

end
