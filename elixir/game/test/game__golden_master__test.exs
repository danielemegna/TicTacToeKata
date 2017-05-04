defmodule Game_GoldenMaster_Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "match error when wrong input is provided" do
    capture_io([input: "wrong_input", capture_prompt: false], fn ->
      assert_raise MatchError, fn ->
        Game.start_game
      end
    end)
  end

  test "fast game over golden master" do
    assert game("0\n1\n3\n") ==
      "\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   X   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  X   X   O\n ===+===+=== \n  3   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   X   O\n ===+===+=== \n  X   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  X   X   O\n ===+===+=== \n  X   O   5\n ===+===+=== \n  O   7   8\n\n--------------\n\nGame Over"
  end

  test "tie game golden master" do
    assert game("0\n6\n5\n1\n7\n") ==
    "\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   1   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   8\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  O   O   5\n ===+===+=== \n  X   7   8\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   1   2\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   7   8\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   7   O\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   X   2\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   7   O\n\n--------------\n\n\n--------------\n\n  X   X   O\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   7   O\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   X   O\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   X   O\n\n--------------\n\nGame Over"
  end

  test "win game golden master" do
    assert game("6\n2\n0\n3\n") ==
    "\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  X   7   8\n\n--------------\n\n\n--------------\n\n  0   1   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   8\n\n--------------\n\nEnter [0-8]\n--------------\n\n  0   1   X\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   8\n\n--------------\n\n\n--------------\n\n  0   1   X\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   O\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   1   X\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   O\n\n--------------\n\n\n--------------\n\n  X   O   X\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   O\n\n--------------\n\nEnter [0-8]\n--------------\n\n  X   O   X\n ===+===+=== \n  X   O   5\n ===+===+=== \n  X   7   O\n\n--------------\n\nGame Over"
  end

  defp game(input) do
    capture_io([input: input, capture_prompt: false], fn ->
      Game.start_game
    end)
  end

end
