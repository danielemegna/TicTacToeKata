defmodule TicTacToe.PlayerFactory_Test do
  use ExUnit.Case
  alias TicTacToe.{Player,PlayerFactory}

  test 'human vs human' do
    assert_build([{"X", :human},{"O", :human}], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Human },
    ])
  end

  test 'medium computer vs hard computer ' do
    assert([{"X", :medium},{"O", :hard}], [
      %Player{ sign: "X", strategy: Player.Strategy.Medium },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'human vs hard player' do
    assert_build([{"X", :human},{"O", :hard}], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ])
  end

  test 'human vs easy player' do
    assert([{"O", :human},{"X", :easy}], [
      %Player{ sign: "O", strategy: Player.Strategy.Human },
      %Player{ sign: "X", strategy: Player.Strategy.Easy },
    ])
  end

  test 'human vs medium player' do
    assert_build([{"X", :human},{"O", :medium}], [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Medium },
    ])
  end

  test 'hard computer vs human player' do
    assert_build([{"X", :hard},{"O", :human}], [
      %Player{ sign: "X", strategy: Player.Strategy.Hard },
      %Player{ sign: "O", strategy: Player.Strategy.Human },
    ])
  end

  defp assert_build(input, expected) do
    assert PlayerFactory.build(input) == expected
  end

end
