defmodule TicTacToe.PlayerFactory_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import TestCommons
  alias TicTacToe.{Player,PlayerFactory}

  test 'human vs human choosen' do
    assert_pair([:human_vs_human], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Human },
    ])
  end

  test 'medium computer vs hard computer choosen' do
    user_input = [
      :computer_vs_computer,:medium_computer_player,
      :hard_computer_player
    ]
    assert_pair(user_input, [
      %Player{ sign: "X", strategy: Player.Strategy.Medium },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'human vs hard player choosen' do
    assert_pair([:human_vs_computer,:hard_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'human vs easy player choosen' do
    assert_pair([:human_vs_computer,:easy_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Easy },
    ])
  end

  test 'human vs medium player choosen' do
    assert_pair([:human_vs_computer,:medium_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Medium },
    ])
  end

  test 'hard computer vs human player' do
    assert_pair([:computer_vs_human,:hard_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Hard },
      %Player{ sign: "O", strategy: Player.Strategy.Human },
    ])
  end

  test 'bad input provided' do
    output = assert_pair(["bad",:human_vs_computer,5,:hard_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
    assert_contains(output, "Bad input! Retry..")
  end

  test 'pair writes out menu to choose game type' do
    valid_user_inputs = user_inputs_for([
      :human_vs_computer,:medium_computer_player
    ])
    output = capture_io(valid_user_inputs, fn ->
      PlayerFactory.pair
    end)

    assert_contains(output,
      "Choose game type\n"<>
      " 1. Human v. Human\n"<>
      " 2. Human v. Computer\n"<>
      " 3. Computer v. Human\n"<>
      " 4. Computer v. Computer\n"<>
      "Enter [1-4]>")
  end

  test 'pair writes out menu to choose the difficulty' do
    valid_user_inputs = user_inputs_for([
      :human_vs_computer,:medium_computer_player
    ])
    output = capture_io(valid_user_inputs, fn ->
      PlayerFactory.pair
    end)

    assert_contains(output,
      "Choose computer level of difficulty ('O' symbol player)\n"<>
      " 1. Easy\n"<>
      " 2. Medium\n"<>
      " 3. Hard (unbeatable)\n"<>
      "Enter [1-3]>")
  end

  defp assert_pair(user_input, expected) do
    input = user_inputs_for(user_input)
    capture_io(input, fn ->
      assert PlayerFactory.pair == expected
    end)
  end

end
