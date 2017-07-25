defmodule TicTacToe.Player_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.{Player,Board}

  @stub_player %{
    sign: "S",
    strategy: TicTacToe.Player_Test.Strategy.Stub
  }

  test 'play function marks board with strategy next move' do
    board = Board.new
    expected_board = Board.new [
       0 , 1 , 2,
       3 ,"S", 5,
       6 , 7 , 8
    ]

    capture_io(fn ->
      assert Player.play(board, @stub_player) == expected_board
    end)
  end

  test 'play function prints out last marked position' do
    expected_output = "'S' marked 4 position\n"

    assert capture_io(fn ->
      Player.play(Board.new, @stub_player)
    end) == expected_output
  end

end

defmodule TicTacToe.Player_Test.Strategy.Stub, do:
  def next_move(_, _), do: 4
