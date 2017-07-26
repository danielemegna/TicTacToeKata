defmodule TicTacToe.Board do
  defstruct size: 3, occupied: %{}

  def new do
    %__MODULE__{}
  end

  def free?(board, index) do
    !Map.has_key?(board.occupied, index)
  end

  def mark(board, index, sign) do
    new_occupied = board.occupied |> Map.put(index, sign)
    %__MODULE__{size: board.size, occupied: new_occupied}
  end

  def at(board, index) do
    board.occupied[index] || :empty
  end

  def available_moves(board) do
    Enum.to_list 0..last_index(board)
      |> Enum.filter(&(free?(board, &1)))
  end

  def full?(board) do
    available_moves(board) |> Enum.count == 0
  end

  def row(board, row) do
    0..board.size-1
      |> Enum.reduce([], fn(column, result) ->
          value = at(board, (board.size*row) + column)
          result ++ [value]
      end)
  end
 
  defp last_index(board) do
    round(board.size*board.size)-1
  end

end
