defmodule TicTacToe.HumanPlayer do

  def next_move(board) do
    IO.write("Enter [0-8]")
    next_move = IO.gets(">")
    {num, _} = Integer.parse(next_move)

    if Enum.at(board, num) != "X" && Enum.at(board, num) != "O" do
      num
    else
      next_move(board)
    end
  end

end
