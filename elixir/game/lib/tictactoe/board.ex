defmodule TicTacToe.Board do
  defstruct size: 3, occupied: %{}

  def new(), do: %__MODULE__{}
  def new(size), do: %__MODULE__{size: size}

  def free?(board, index) do
    validate(board, index)
    !Map.has_key?(board.occupied, index)
  end

  def mark(board, index, sign) do
    validate(board, index)
    new_occupied = board.occupied |> Map.put(index, sign)
    %__MODULE__{size: board.size, occupied: new_occupied}
  end

  def at(board, index) do
    validate(board, index)
    board.occupied[index] || :empty
  end

  def at(board, row, column) do
    at(board, (board.size*row) + column)
  end

  def available_moves(board) do
    Enum.to_list 0..last_index(board)
      |> Enum.filter(&(free?(board, &1)))
  end

  def full?(board) do
    available_moves(board) |> Enum.count == 0
  end

  def row(board, row) do
    0..bound(board) |> Enum.reduce([], fn(column, result) ->
      result ++ [at(board, row, column)]
    end)
  end

  def column(board, column) do
    0..bound(board) |> Enum.reduce([], fn(row, result) ->
      result ++ [at(board, row, column)]
    end)
  end

  def diagonal(board, diagonal, direction) when direction == :down do
    diagonal..bound(board) |> Enum.reduce([], fn(index, result) ->
      result ++ [at(board, index, index-diagonal)]
    end)
  end

  def diagonal(board, diagonal, direction) when direction == :up do
    diagonal..0 |> Enum.reduce([], fn(index, result) ->
      result ++ [at(board, index, diagonal-index)]
    end)
  end

  defp validate(board, index) do
    unless(index >= 0 and index <= last_index(board)) do
      raise(ArgumentError, "Out of board bound error")
    end
  end
 
  defp last_index(board), do: round(board.size*board.size)-1
  defp bound(board), do: board.size-1

end
