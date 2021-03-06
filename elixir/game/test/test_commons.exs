defmodule TestCommons do
  use ExUnit.Case
  alias TicTacToe.Board

  @user_inputs_map %{
    human_vs_human: 1,
    human_vs_computer: 2,
    computer_vs_human: 3,
    computer_vs_computer: 4,
    
    easy_computer_player: 1,
    medium_computer_player: 2,
    hard_computer_player: 3,
  }

  def user_inputs_for(choices) do
    choices
      |> Enum.map(&Map.get(@user_inputs_map, &1, &1))
      |> Enum.join("\n")
  end

  def board_from(list) do
    size = round(:math.sqrt(Enum.count(list)))
    list
      |> Enum.with_index
      |> Enum.filter(fn({sign,_}) -> !is_integer(sign) end)
      |> Enum.reduce(Board.new(size), fn({sign,index}, board) ->
          Board.mark(board, index, sign)
        end)
  end

  def assert_contains(_, []), do: :ok
  def assert_contains(string, [first|rest]) do
    assert_contains(string, first)
    assert_contains(string, rest)
  end
  def assert_contains(string, substring) do
    assert String.contains?(string, substring),
      "Expected #{inspect string} to contain #{inspect substring}"
  end

  def assert_not_contains(_, []), do: :ok
  def assert_not_contains(string, [first|rest]) do
    assert_not_contains(string, first)
    assert_not_contains(string, rest)
  end
  def assert_not_contains(string, substring) do
    assert !String.contains?(string, substring),
      "Expected #{inspect string} to NOT contain #{inspect substring}"
  end

end
