defmodule AdventPuzzle.Maze.StatePresenter do
  alias AdventPuzzle.Maze.State

  def repr_info(%State{state: :complete, steps: steps}),
    do: "Maze completed in #{steps} steps"

  def repr(%State{state: :complete, steps: steps}=state),
    do: repr(state, "COMPLETED [#{steps}]:")

  def repr(%State{state: :uncompleted, steps: steps}=state),
    do: repr(state, "UNCOMPLETED [#{steps}]:")

  def repr(%State{offset: offset, seq: seq}, acc) do
    seq
    |> Map.values()
    |> repr_items(offset, 0, acc)
    |> String.trim()
  end

  defp repr_items([head|tail], offset, curr_index, aggregate) do
    if offset == curr_index do
      repr_items(tail, offset, curr_index + 1, "#{aggregate} (#{head})")
    else
      repr_items(tail, offset, curr_index + 1, "#{aggregate} #{head}")
    end
  end

  defp repr_items([], _offset, _curr_index, aggregate), do: aggregate

end
