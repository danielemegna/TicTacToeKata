defmodule TestCommons do
  use ExUnit.Case

  @user_inputs_map %{
    human_vs_human: 1,
    computer_vs_computer: 2,
    human_vs_computer: 3,
    
    easy_computer_player: 1,
    medium_computer_player: 2,
    hard_computer_player: 3,

    first_player_before: 1,
    second_player_before: 2
  }

  def user_inputs_for(players_choice, game_moves \\ []) do
    players_choice = players_choice |>
      Enum.map(&Map.get(@user_inputs_map, &1, &1))

    user_inputs = players_choice ++ game_moves
    Enum.join(user_inputs, "\n")
  end

  def assert_contains(string, substring) do
    assert String.contains?(string, substring),
      "Expected #{inspect string} to contain #{inspect substring}"
  end

  def assert_not_contains(string, substring) do
    assert !String.contains?(string, substring),
      "Expected #{inspect string} to NOT contain #{inspect substring}"
  end

end
