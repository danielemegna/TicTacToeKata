defmodule Game do
  alias TicTacToe.ConsoleBoardPrinter, as: BoardPrinter

  def start_game do
    b = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    print_board(b)
    play_moves(b, "X")
  end

  def play_moves(board, player) do
    if(game_over(board) || tie(board)) do
      IO.write("Game Over")
    else
      play_moves(choose_move(board, player), toggle_player(player))
    end
  end

  def choose_move(board, player) do
    cond do
      player == "X" -> get_humans_turn(board)
      player == "O" -> get_computers_turn(board)
    end
  end

  def toggle_player(player) do
    if(player == "X") do
      "O"
    else "X"
    end
  end

  def get_humans_turn(board) do
    IO.write("Enter [0-8]")
    next_move = IO.gets(">")
    {num, _} = Integer.parse(next_move)

    # if its a free space
    if Enum.at(board, num) != "X" && Enum.at(board, num) != "O" do
      updated_board = List.update_at(board, num, fn(x) -> "X" end)
      print_board(updated_board)
      updated_board
    else
      get_humans_turn(board)
    end
  end

  def get_computers_turn(board) do
    if Enum.at(board, 4) == 4 do
      new_board = List.update_at(board, 4, fn(x) -> "O" end)
      print_board(new_board)
      new_board
    else
      comp_turn = evaluate(board)
      new_board = List.update_at(board, comp_turn, fn(x) -> "O" end)
      print_board(new_board)
      new_board
    end
  end

  def evaluate(board) do
    indexed_board = Enum.with_index(board, 0)
    filtered = Enum.filter(indexed_board, fn({value, _}) -> value != "X" && value != "O" end)
    #choose a space for next move
    available_moves = Enum.map(filtered, fn({value, index}) -> index end)
    get_best_move(available_moves, board)
  end

  def get_best_move([first|[]], board) do
    first
  end

  def get_best_move([first_index|rest], board) do
    cond do
      game_over(List.update_at(board, first_index, fn(x) -> "O" end)) -> first_index
      game_over(List.update_at(board, first_index, fn(x) -> "X" end)) -> first_index
      true -> get_best_move(rest, board)
    end
  end

  defp tie(board) do
    TicTacToe.Referee.tie?(board)
  end

  defp game_over(board) do
    TicTacToe.Referee.game_over?(board)
  end

  defp print_board(b) do
    BoardPrinter.print(b)
  end

end
