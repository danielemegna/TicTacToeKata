defmodule TicTacToe.Player do
  alias TicTacToe.Board
  alias TicTacToe.IOAdapter

  @enforce_keys [:sign, :strategy]
  defstruct @enforce_keys

  def play(board, player) do
    player_sign = player.sign
    next_move = player.strategy.next_move(board, player_sign)

    IOAdapter.cell_marked(player_sign, next_move)
    board |> Board.mark(next_move, player_sign)
  end
end
