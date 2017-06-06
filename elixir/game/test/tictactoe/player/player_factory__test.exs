defmodule TicTacToe.PlayerFactory_Test do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Player
  alias TicTacToe.PlayerFactory

  test 'pair returns human and hard players' do
    capture_io(fn ->
      assert PlayerFactory.pair == [
        %Player{ sign: "X", strategy: Player.Strategy.Human },
        %Player{ sign: "O", strategy: Player.Strategy.Hard },
      ]
    end)
  end

  test 'pair writes out menu to choose the difficulty' do
    output = capture_io(fn ->
      PlayerFactory.pair
    end)

    assert output == "Choose computer level of difficulty\n"<>
      " 1. Easy\n"<>
      " 2. Medium\n"<>
      " 3. Hard (unbeatable)\n"<>
      "Enter [1-3]>"<>
      "Hard computer player choosen\n"
  end

end
