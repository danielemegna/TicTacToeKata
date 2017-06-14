defmodule TicTacToe.PlayerFactory do
  alias TicTacToe.Player

  def pair do
    choose_game_type()
      |> pair_for_game_type
  end

  defp choose_game_type do
    "Choose game type\n"<>
    " 1. Human v. Human\n"<>
    " 2. Computer v. Computer\n"<>
    " 3. Human v. Computer\n"<>
    "Enter [1-3]>"
      |> IO.gets
      |> Integer.parse
      |> game_type_for
  end

  defp game_type_for({type, _}) when type >= 1 and type <= 3, do: type
  defp game_type_for(_) do
    "Bad input! Retry..\n" |> IO.puts
    choose_game_type()
  end

  defp pair_for_game_type(1) do
    [ %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Human }]
  end

  defp pair_for_game_type(3) do
    [ %Player{ sign: "X", strategy: Player.Strategy.Human },
      computer_player()]
  end

  defp computer_player do
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
    computer_player()
  end

  defp computer_strategy_for(type) do
    case type do
      1 -> Player.Strategy.Easy
      2 -> Player.Strategy.Medium
      _ -> Player.Strategy.Hard
    end
  end

end
