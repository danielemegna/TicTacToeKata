defmodule TicTacToe.PlayerFactory do
  alias TicTacToe.Player

  def pair do
    "Choose computer level of difficulty\n"<>
      " 1. Easy\n"<>
      " 2. Medium\n"<>
      " 3. Hard (unbeatable)\n"<>
      "Enter [1-3]>" |> IO.write

    "Hard computer player choosen" |> IO.puts

    [
      %Player{ sign: "X", strategy: Player.Strategy.Human },
      %Player{ sign: "O", strategy: Player.Strategy.Hard },
    ]
  end

end
