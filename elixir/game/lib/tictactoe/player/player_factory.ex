defmodule TicTacToe.PlayerFactory do
  alias TicTacToe.Player
  alias TicTacToe.IOAdapter

  def pair, do:
    choose_game_type() |> pair_for_game_type

  defp choose_game_type, do: IOAdapter.game_type? |> game_type_for
  defp game_type_for({type, _}) when type in 1..4, do: type
  defp game_type_for(_) do
    IOAdapter.bad_input
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

  defp computer_player(sign), do:
      IOAdapter.difficulty_level?(sign) |> computer_player_for(sign)

  defp computer_player_for({type, _},sign) when type in 1..3, do:
    %Player{ sign: sign, strategy: computer_strategy_for(type) }

  defp computer_player_for(_,sign) do
    IOAdapter.bad_input
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
