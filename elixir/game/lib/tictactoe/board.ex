defmodule Board do
  defstruct cells: [0,1,2,3,4,5,6,7,8]

  def free?(board, index) do
    Enum.at(board.cells, index) == index
  end

  def mark(board, index, sign) do
    new_cells = List.replace_at(board.cells, index, sign)
    %Board{board | cells: new_cells}
  end

end
