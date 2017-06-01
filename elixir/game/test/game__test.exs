defmodule Game_Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "fast game over smoke test" do
    user_inputs = [0,1,3]
    output = game(user_inputs)

    assert_contains(output, "Enter [0-8]>")
    assert_contains(output, "X")
    assert_contains(output, "O wins! Game Over")
  end

  test "tie game smoke test" do
    user_inputs = [4,2,3,1,8]
    output = game(user_inputs)

    assert_contains(output, "X")
    assert_contains(output, "O")
    assert_contains(output, "Tie! Game Over")
  end

  test "wrong inputs smoke test" do
    user_inputs = ["bad",0,4,1,2,5]
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
