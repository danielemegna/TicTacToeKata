defmodule TicTacToe.PlayerFactory_Test do
  use ExUnit.Case
  alias TicTacToe.Player
  alias TicTacToe.PlayerFactory

  test 'pair returns human and hard players' do
    assert PlayerFactory.pair == [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ]
  end

end
