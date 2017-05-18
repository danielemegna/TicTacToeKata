defmodule TicTacToe.Board do
  defstruct cells: [0,1,2,3,4,5,6,7,8]

  def new do
    %__MODULE__{}
  end

  def free?(board, index) do
    at(board, index) == index
  end

  def mark(board, index, sign) do
    new_cells = List.replace_at(board.cells, index, sign)
    %__MODULE__{board | cells: new_cells}
  end

  def at(board, index) do
    Enum.at(board.cells, index)
  end

  def full?(board) do
    !has_free_cells?(board)
  end

  def available_moves(board) do
    Enum.with_index(board.cells)
      |> Enum.filter(fn {value, _} -> is_integer(value) end)
      |> Enum.map(fn {_, index} -> index end)
  end

  defp has_free_cells?(board) do
    Enum.any?(board.cells, fn(x) -> is_integer(x) end)
  end

end
