defmodule TicTacToe.PlayerChooser do
  alias TicTacToe.IOAdapter

  def start do
    case IOAdapter.game_type? do
      {1,_} -> [ human_player("X"),     human_player("O")     ]
      {2,_} -> [ human_player("X"),     computer_player("O")  ]
      {3,_} -> [ computer_player("X"),  human_player("O")     ]
      {4,_} -> [ computer_player("X"),  computer_player("O")  ]
      _ -> IOAdapter.bad_input(); start()
    end
  end

  defp human_player(sign), do: { sign, :human }
  defp computer_player(sign), do: { sign, computer_strategy_for(sign) }

  defp computer_strategy_for(sign) do
    case IOAdapter.difficulty_level?(sign) do
      {1,_} -> :easy
      {2,_} -> :medium
      {3,_} -> :hard
      _ -> IOAdapter.bad_input(); computer_strategy_for(sign)
    end
  end

end
