defmodule TicTacToe.Player do
  alias TicTacToe.Board

  @enforce_keys [:sign, :strategy]
  defstruct @enforce_keys

  def play(board, player) do
    board |> Board.mark(
      player.strategy.next_move(board, player.sign),
      player.sign
    )
  end

end
