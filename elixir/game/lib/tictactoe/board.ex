defmodule TicTacToe.Board do
  defstruct cells: [0,1,2,3,4,5,6,7,8]

  def new do
    %__MODULE__{}
  end

  def at(board, index) do
    Enum.at(board.cells, index)
  end

  def free?(board, index) do
    at(board, index) == index
  end

  def mark(board, index, sign) do
    new_cells = List.replace_at(board.cells, index, sign)
    %__MODULE__{cells: new_cells}
  end

  def full?(board) do
    !has_free_cells?(board)
  end

  def print(board) do
    IO.write("\n--------------\n\n  ")
    IO.write("#{at(board, 0)}   ")
    IO.write("#{at(board, 1)}   ")
    IO.write("#{at(board, 2)}")
    IO.write("\n ===+===+=== \n  ")
    IO.write("#{at(board, 3)}   ")
    IO.write("#{at(board, 4)}   ")
    IO.write("#{at(board, 5)}")
    IO.write("\n ===+===+=== \n  ")
    IO.write("#{at(board, 6)}   ")
    IO.write("#{at(board, 7)}   ")
    IO.write("#{at(board, 8)}\n")
    IO.write("\n--------------\n\n")
    board
  end

  def available_moves(board) do
    board
      |> cells_with_index
      |> only_available
      |> extract_indexes
  end

  defp cells_with_index(board) do
    Enum.with_index(board.cells)
  end

  defp only_available(cells_with_index) do
    cells_with_index |> Enum.filter(fn {value, _} -> is_integer(value) end)
  end

  defp extract_indexes(cells_with_index) do
    cells_with_index |> Enum.map(fn {_, index} -> index end)
  end

  defp has_free_cells?(board) do
    Enum.any?(board.cells, fn(x) -> is_integer(x) end)
  end

end
