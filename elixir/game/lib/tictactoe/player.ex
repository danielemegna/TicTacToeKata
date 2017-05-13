defmodule TicTacToe.Player do
  @enforce_keys [:sign, :strategy]
  defstruct @enforce_keys
end
