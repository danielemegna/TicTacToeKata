defmodule TicTacToe.Player.Strategy.Hard_Test do
  use ExUnit.Case
  alias TicTacToe.Board
  alias TicTacToe.Player

  test "one move available" do
    assert next_move([
      "X","O","X",
      "O","X","O",
       6 ,"X","O"
    ]) == 6
  end
  
  test "winner move available" do
    assert next_move([
      "X", 1 , 2 ,
      "O","X","O",
      "X","X","O"
    ]) == 2
  end
  
  test "avoid opponent win" do
    assert next_move([
      "O","X","O",
       3 ,"X","O",
       6 , 7 ,"X"
    ]) == 7
  end
  
  test "win over avoid opponent win" do
    assert next_move([
      "O","X","X",
      "O","X","O",
       6 , 7 ,"X"
    ]) == 6
  end
  
  test "center cell is the best second move" do
    assert next_move([
      "X", 1 , 2 ,
       3 , 4 , 5 ,
       6 , 7 , 8
    ]) == 4
  end

  test "corner cell is the best first move" do
    assert next_move([
       0 , 1 , 2 ,
       3 , 4 , 5 ,
       6 , 7 , 8
    ]) == 0
  end

  defp next_move(board) do
    Player.Strategy.Hard.next_move(%Board{cells: board}, "O")
  end

end
