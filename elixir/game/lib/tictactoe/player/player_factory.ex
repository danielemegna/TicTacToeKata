defmodule TicTacToe.PlayerFactory do
  alias TicTacToe.Player

  def pair do
    choose_game_type()
      |> pair_for_game_type
  end

  defp choose_game_type do
    "Choose game type\n"<>
    " 1. Human v. Human\n"<>
    " 2. Human v. Computer\n"<>
    " 3. Computer v. Human\n"<>
    " 4. Computer v. Computer\n"<>
    "Enter [1-4]>"
      |> IO.gets
      |> Integer.parse
      |> game_type_for
  end

  defp game_type_for({type, _}) when type in 1..4, do: type
  defp game_type_for(_) do
    "Bad input! Retry..\n" |> IO.puts
    choose_game_type()
  end

  defp pair_for_game_type(type) do
    case type do
      1 -> [ human_player("X"),     human_player("O")     ]
      2 -> [ human_player("X"),     computer_player("O")  ]
      3 -> [ computer_player("X"),  human_player("O")     ]
      4 -> [ computer_player("X"),  computer_player("O")  ]
    end
  end

  defp human_player(sign), do:
    %Player{ sign: sign, strategy: Player.Strategy.Human }

  defp computer_player(sign) do
    "Choose computer level of difficulty ('#{sign}' symbol player)\n"<>
    " 1. Easy\n"<>
    " 2. Medium\n"<>
    " 3. Hard (unbeatable)\n" <>
    "Enter [1-3]>"
      |> IO.gets
      |> Integer.parse
      |> computer_player_for(sign)
  end

  defp computer_player_for({type, _},sign) when type in 1..3 do
    %Player{ sign: sign, strategy: computer_strategy_for(type) }
  end

  defp computer_player_for(_,sign) do
    "Bad input! Retry..\n" |> IO.puts
    computer_player(sign)
  end

  defp computer_strategy_for(type) do
    case type do
      1 -> Player.Strategy.Easy
      2 -> Player.Strategy.Medium
      3 -> Player.Strategy.Hard
    end
  end

end
