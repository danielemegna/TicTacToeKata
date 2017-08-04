defmodule TicTacToe.Player.Strategy.Human do
  alias TicTacToe.Board
  alias TicTacToe.IOAdapter

  def next_move(board, sign) do
    IOAdapter.next_move?(sign, Board.last_index(board))
      |> validate(board, sign)
  end

  defp validate({move, _}, board, sign) do
    try do validate(move, board, sign)
    rescue ArgumentError -> bad_input(board, sign) end
  end

  defp validate(move, board, sign) when is_integer(move) do
    unless Board.free?(board,move) do
      IOAdapter.cell_already_marked(move)
      next_move(board, sign)
    else move end
  end

  defp validate(_, board, sign), do: bad_input(board, sign)

  defp bad_input(board, sign) do
    IOAdapter.bad_input()
    next_move(board, sign)
  end

end
