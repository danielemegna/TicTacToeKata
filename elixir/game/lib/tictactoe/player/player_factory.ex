defmodule TicTacToe.PlayerFactory do
  alias TicTacToe.Player

  def pair do
    [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      choose_computer_player(),
    ]
  end

  defp choose_computer_player do
    "Choose computer level of difficulty\n"<>
    " 1. Easy\n"<>
    " 2. Medium\n"<>
    " 3. Hard (unbeatable)\n" <>
    "Enter [1-3]>"
      |> IO.gets
      |> Integer.parse
      |> computer_player_for
  end

  defp computer_player_for({type, _}) when type >= 1 and type <= 3 do
    %Player{ sign: "O", strategy: computer_strategy_for(type) }
  end

  defp computer_player_for(_) do
    "Bad input! Retry..\n" |> IO.puts
    choose_computer_player()
  end

  defp computer_strategy_for(type) do
    case type do
      2 -> Player.Strategy.Medium
      _ -> Player.Strategy.Hard
    end
  end

end
