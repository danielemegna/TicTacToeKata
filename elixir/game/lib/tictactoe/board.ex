defmodule TicTacToe.Board do
  alias :math, as: Math
  defstruct size: 3, occupied: %{}

  def new do
    %__MODULE__{}
  end

  def new(values) do
    size = round(Math.sqrt(Enum.count(values)))
    occupied = values
      |> Enum.with_index()
      |> Enum.filter(fn {value,_}-> !is_integer(value) end)
      |> Enum.map(fn {v,i}->{i,v} end)
      |> Map.new

    %__MODULE__{size: size, occupied: occupied}
  end

  def free?(board, index) do
    !Map.has_key?(board.occupied, index)
  end

  def mark(board, index, sign) do
    new_occupied = Map.put(board.occupied, index, sign)
    %__MODULE__{size: board.size, occupied: new_occupied}
  end

  def at(board, index) do
    board.occupied[index] || :empty
  end

  def full?(board) do
    Enum.count(Map.keys(board.occupied)) == (board.size*board.size)
  end
 
  def available_moves(board) do
    last_index = round(board.size*board.size)-1
    Enum.to_list 0..last_index
      |> Enum.filter(&(free?(board, &1)))
  end

end
