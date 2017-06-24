defmodule TicTacToe.Player do
  alias TicTacToe.Board

  @enforce_keys [:sign, :strategy]
  defstruct @enforce_keys

  def play(board, player) do
    player_sign = player.sign
    next_move = player.strategy.next_move(board, player_sign)

    "'#{player_sign}' marked #{next_move} position" |> IO.puts
    board |> Board.mark(next_move, player_sign)
  end
end
