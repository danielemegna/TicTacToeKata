defmodule TicTacToe.NewBoard do
  defstruct size: 3, occupied: %{}

  def new do
    %__MODULE__{}
  end

  def free?(board, index) do
    !Map.has_key?(board.occupied, index)
  end

  def mark(board, index, sign) do
    new_occupied = Map.put(board.occupied, index, sign)
    %__MODULE__{size: board.size, occupied: new_occupied}
  end

end
