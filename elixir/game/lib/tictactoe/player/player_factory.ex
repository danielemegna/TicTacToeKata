defmodule TicTacToe.PlayerFactory do
  alias TicTacToe.Player

  def build(players) do
    players |> Enum.map(fn({sign,strategy}) ->
      %Player{ sign: sign, strategy: strategy_for(strategy) }
    end)
  end

  defp strategy_for(strategy) do
    case strategy do
    :human -> Player.Strategy.Human
    :easy -> Player.Strategy.Easy
    :medium -> Player.Strategy.Medium
    :hard -> Player.Strategy.Hard
    end
  end

end
