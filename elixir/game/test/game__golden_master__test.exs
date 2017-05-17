defmodule Game_GoldenMaster_Test do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "fast game over golden master" do
    assert game("0\n1\n3\n") ==
      "\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   X   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  X   X   O\n ===+===+=== \n  3   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   X   O\n ===+===+=== \n  X   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  X   X   O\n ===+===+=== \n  X   O   5\n ===+===+=== \n  O   7   8\n\n--------------\n\nGame Over"

    assert_received {:game_result, :ok}
  end

  test "tie game golden master" do
    assert game("0\n6\n5\n1\n7\n") ==
    "\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   1   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   8\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  O   O   5\n ===+===+=== \n  X   7   8\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   1   2\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   7   8\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   7   O\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   X   2\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   7   O\n\n--------------\n\n\n--------------\n\n  X   X   O\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   7   O\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   X   O\n ===+===+=== \n  O   O   X\n ===+===+=== \n  X   X   O\n\n--------------\n\nGame Over"

    assert_received {:game_result, :ok}
  end

  test "win game golden master" do
    assert game("6\n2\n0\n3\n") ==
    "\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  X   7   8\n\n--------------\n\n\n--------------\n\n  0   1   2\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   8\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  0   1   X\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   8\n\n--------------\n\n\n--------------\n\n  0   1   X\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   O\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   1   X\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   O\n\n--------------\n\n\n--------------\n\n  X   O   X\n ===+===+=== \n  3   O   5\n ===+===+=== \n  X   7   O\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   O   X\n ===+===+=== \n  X   O   5\n ===+===+=== \n  X   7   O\n\n--------------\n\nGame Over"

    assert_received {:game_result, :ok}
  end

  test "wrong inputs golden master" do
    assert game("bad\n9\n4\nbad\n-1\n0\n1\n3") ==
      "\n--------------\n\n  0   1   2\n ===+===+=== \n  3   4   5\n ===+===+=== \n  6   7   8\n\n--------------\n\nEnter [0-8]>Bad input! Retry..\nEnter [0-8]>Cell 9 already marked! Retry..\nEnter [0-8]>\n--------------\n\n  0   1   2\n ===+===+=== \n  3   X   5\n ===+===+=== \n  6   7   8\n\n--------------\n\n\n--------------\n\n  0   1   2\n ===+===+=== \n  3   X   5\n ===+===+=== \n  6   7   O\n\n--------------\n\nEnter [0-8]>Bad input! Retry..\nEnter [0-8]>Cell -1 already marked! Retry..\nEnter [0-8]>\n--------------\n\n  X   1   2\n ===+===+=== \n  3   X   5\n ===+===+=== \n  6   7   O\n\n--------------\n\n\n--------------\n\n  X   1   2\n ===+===+=== \n  3   X   5\n ===+===+=== \n  6   O   O\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   X   2\n ===+===+=== \n  3   X   5\n ===+===+=== \n  6   O   O\n\n--------------\n\n\n--------------\n\n  X   X   O\n ===+===+=== \n  3   X   5\n ===+===+=== \n  6   O   O\n\n--------------\n\nEnter [0-8]>\n--------------\n\n  X   X   O\n ===+===+=== \n  X   X   5\n ===+===+=== \n  6   O   O\n\n--------------\n\n\n--------------\n\n  X   X   O\n ===+===+=== \n  X   X   O\n ===+===+=== \n  6   O   O\n\n--------------\n\nGame Over"
  end

  defp game(input) do
    capture_io(input, fn ->
      game_result = Game.start_game
      send self(), {:game_result, game_result}
    end)
  end

end
