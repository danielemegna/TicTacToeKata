defmodule TicTacToe.PlayerChooser do
  alias TicTacToe.IOAdapter

  def start, do:
    choose_game_type() |> pair_for_game_type

  defp choose_game_type, do: IOAdapter.game_type? |> game_type_for
  defp game_type_for({type, _}) when type in 1..4, do: type
  defp game_type_for(_) do
    IOAdapter.bad_input()
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

  defp human_player(sign), do: { sign, :human }

  defp computer_player(sign), do:
      IOAdapter.difficulty_level?(sign) |> computer_player_for(sign)

  defp computer_player_for({difficulty, _},sign) when difficulty in 1..3, do:
    { sign, computer_strategy_for(difficulty) }

  defp computer_player_for(_,sign) do
    IOAdapter.bad_input()
    computer_player(sign)
  end

  defp computer_strategy_for(difficulty) do
    case difficulty do
      1 -> :easy
      2 -> :medium
      3 -> :hard
    end
  end

end
