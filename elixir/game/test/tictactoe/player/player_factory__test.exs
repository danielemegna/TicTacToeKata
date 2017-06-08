defmodule TicTacToe.PlayerFactory_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Player
  alias TicTacToe.PlayerFactory

  test 'pair writes out menu to choose the difficulty' do
    output = capture_io("3", fn ->
      PlayerFactory.pair
    end)

    assert output ==
      "Choose computer level of difficulty\n"<>
      " 1. Easy\n"<>
      " 2. Medium\n"<>
      " 3. Hard (unbeatable)\n"<>
      "Enter [1-3]>"
  end

  test 'hard player choosen' do
    assert_pair(3, [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'medium player choosen' do
    assert_pair(2, [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Medium },
    ])
  end

  test 'bad input provided' do
    output = assert_pair(["bad", 3], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])

    assert_contains(output, "Bad input! Retry..")
  end

  defp assert_pair(list, expected) when is_list(list), do:
    assert_pair(Enum.join(list, "\n"), expected)

  defp assert_pair(integer, expected) when is_integer(integer), do:
    assert_pair(Integer.to_string(integer), expected)

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
