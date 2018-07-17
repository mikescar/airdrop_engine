defmodule AirdropEngine.Board do
  alias AirdropEngine.{Coordinate, Island}

  def new(), do: %{}

  def all_islands_positioned?(board), do:
    Enum.all?(Island.types, &(Map.has_key?(board, &1)))

  def guess(board, %Coordinate{} = coordinate) do
    board
    |> check_all_islands(coordinate)
    |> guess_response(board)
  end

  def position_island(board, key, %Island{} = island) do
    case overlaps_existing_island?(board, key, island) do
      true -> {:error, :overlapping_island}
      false -> Map.put(board, key, island)
    end
  end

  defp check_all_islands(board, coordinate) do
    Enum.find_value(board, :miss, fn {key, island} ->
      case Island.guess(island, coordinate) do
        {:hit, island} -> {key, island}
        :miss          -> false
      end
    end)
  end

  defp guess_response({key, island}, board) do
    board = %{board | key => island}
    {:hit, service_check(board, key), win_check(board), board}
  end
  defp guess_response(:miss, board), do: {:miss, :none, :no_win, board}

  defp overlaps_existing_island?(board, new_key, new_island) do
    Enum.any?(board, fn {key, island} ->
      key != new_key and Island.overlaps?(island, new_island)
    end)
  end

  defp service_check(board, key) do
    case served?(board, key) do
      true  -> key
      false -> :none
    end
  end

  def served_all?(board) do
    case Kernel.length(board) > 0 do
      true  -> Enum.all?(board, fn {_key, island} -> Island.served?(island) end)
      false -> false
    end
  end

  defp served?(board, key) do
    board
    |> Map.fetch!(key)
    |> Island.served?()
  end

  def win_check(board) do
    case served_all?(board) do
      true -> :win
      false -> :no_win
    end
  end
end
