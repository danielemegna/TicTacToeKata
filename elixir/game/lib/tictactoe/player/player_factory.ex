defmodule TicTacToe.PlayerFactory do
  alias TicTacToe.Player

  def pair do
    [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ]
  end

end
