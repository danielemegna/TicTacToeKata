defmodule TicTacToe.Player.Strategy.Human do
  alias TicTacToe.Board

  def next_move(board) do
    IO.write("Enter [0-8]")
    next_move = IO.gets(">")
    {num, _} = Integer.parse(next_move)

    if Board.free?(board, num) do
      num
    else
      next_move(board)
    end
  end

end
