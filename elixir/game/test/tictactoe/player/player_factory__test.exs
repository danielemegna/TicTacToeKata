defmodule TicTacToe.PlayerFactory_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Player
  alias TicTacToe.PlayerFactory

  @human_vs_human 1
  @computer_vs_computer 2
  @human_vs_computer 3

  @easy_computer_player 1
  @medium_computer_player 2
  @hard_computer_player 3

  @valid_human_vs_medium_computer [
    @human_vs_computer,
    @medium_computer_player
  ]

  test 'pair writes out menu to choose game type' do
    valid_user_inputs = user_input(@valid_human_vs_medium_computer)
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
    valid_user_inputs = user_input(@valid_human_vs_medium_computer)
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
    valid_user_inputs = user_input(@valid_human_vs_medium_computer)
    output = capture_io(valid_user_inputs, fn ->
      PlayerFactory.pair
    end)

    assert_contains(output,
      "Who go first?\n"<>
      " 1. Human player (X)\n"<>
      " 2. Medium computer player (O)\n"<>
      "Enter [1-2]>")
  end

  test 'human vs human choosen' do
    assert_pair([@human_vs_human], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Human },
    ])
  end

  test 'medium computer vs hard computer choosen' do
    user_input = [@computer_vs_computer,@medium_computer_player,@hard_computer_player]
    assert_pair(user_input, [
      %Player{ sign: "X", strategy: Player.Strategy.Medium },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'human vs hard player choosen' do
    assert_pair([@human_vs_computer,@hard_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'human vs easy player choosen' do
    assert_pair([@human_vs_computer,@easy_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Easy },
    ])
  end

  test 'human vs medium player choosen' do
    assert_pair([@human_vs_computer,@medium_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Medium },
    ])
  end

  test 'bad input provided' do
    output = assert_pair(["bad",@human_vs_computer,5,@hard_computer_player], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
    assert_contains(output, "Bad input! Retry..")
  end

  defp user_input(list), do: Enum.join(list, "\n")

  defp assert_pair(list, expected) when is_list(list), do:
    assert_pair(user_input(list), expected)
  defp assert_pair(input, expected) do
    capture_io(input, fn ->
      assert PlayerFactory.pair == expected
    end)
  end

  defp assert_contains(string, substring) do
    assert String.contains?(string, substring),
      "Expected #{inspect string} to contain #{inspect substring}"
  end

end
