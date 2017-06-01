defmodule Game_Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "fast game over smoke test" do
    output = game("0\n1\n3\n")

    assert_contains(output, "Enter [0-8]>")
    assert_contains(output, "X")
    assert_contains(output, "O wins! Game Over")
  end

  test "tie game smoke test" do
    output = game("4\n2\n3\n1\n8")

    assert_contains(output, "X")
    assert_contains(output, "O")
    assert_contains(output, "Tie! Game Over")
  end

  test "wrong inputs smoke test" do
    output = game("bad\n9\n0\n-1\n4\n1\n2\n5")

    assert_contains(output, "Bad input! Retry..")
    assert_contains(output, "Cell 4 already marked! Retry..")
    assert_contains(output, "Cell 2 already marked! Retry..")
    assert_contains(output, "O wins! Game Over")
  end

  defp game(input) do
    capture_io(input, fn ->
      assert Game.start_game == :ok
    end)
  end

  defp assert_contains(string, substring) do
    assert String.contains?(string, substring),
      "Expected #{inspect string} to contain #{inspect substring}"
  end

end
