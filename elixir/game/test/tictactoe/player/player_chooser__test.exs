defmodule TicTacToe.PlayerChooser_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import TestCommons
  alias TicTacToe.{PlayerChooser}

  test 'human vs human choosen' do
    user_input = [:human_vs_human]

    assert_choose(user_input, [
      { "X", :human },
      { "O", :human },
    ])
  end

  test 'medium computer vs hard computer choosen' do
    user_input = [
      :computer_vs_computer,
      :medium_computer_player, :hard_computer_player
    ]

    assert_choose(user_input, [
      { "X", :medium },
      { "O", :hard },
    ])
  end

  test 'human vs hard player choosen' do
    assert_choose([:human_vs_computer,:hard_computer_player], [
      { "X", :human },
      { "O", :hard },
    ])
  end

  test 'human vs easy player choosen' do
    assert_choose([:human_vs_computer,:easy_computer_player], [
      { "X", :human },
      { "O", :easy },
    ])
  end

  test 'human vs medium player choosen' do
    assert_choose([:human_vs_computer,:medium_computer_player], [
      { "X", :human },
      { "O", :medium },
    ])
  end

  test 'hard computer vs human player' do
    assert_choose([:computer_vs_human,:hard_computer_player], [
      { "X", :hard },
      { "O", :human },
    ])
  end

  test 'bad input provided' do
    output = assert_choose(["bad",:human_vs_computer,:hard_computer_player], [
      { "X", :human },
      { "O", :hard },
    ])
    assert_contains(output, "Bad input! Retry..")

    output = assert_choose([:computer_vs_human,5,:easy_computer_player], [
      { "X", :easy },
      { "O", :human },
    ])
    assert_contains(output, "Bad input! Retry..")
  end

  test 'it writes out menu to choose game type' do
    valid_user_inputs = user_inputs_for([
      :human_vs_computer,:medium_computer_player
    ])
    output = capture_io(valid_user_inputs, fn ->
      PlayerChooser.start
    end)

    assert_contains(output,
      "Choose game type\n"<>
      " 1. Human v. Human\n"<>
      " 2. Human v. Computer\n"<>
      " 3. Computer v. Human\n"<>
      " 4. Computer v. Computer\n"<>
      "Enter [1-4]>")
  end

  test 'it writes out menu to choose the difficulty' do
    valid_user_inputs = user_inputs_for([
      :human_vs_computer,:medium_computer_player
    ])
    output = capture_io(valid_user_inputs, fn ->
      PlayerChooser.start
    end)

    assert_contains(output,
      "Choose computer level of difficulty ('O' symbol player)\n"<>
      " 1. Easy\n"<>
      " 2. Medium\n"<>
      " 3. Hard (unbeatable)\n"<>
      "Enter [1-3]>")
  end

  defp assert_choose(user_input, expected) do
    capture_io(user_inputs_for(user_input), fn ->
      assert PlayerChooser.start == expected
    end)
  end

end
