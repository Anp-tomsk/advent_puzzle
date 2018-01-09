defmodule AdventPuzzle.MemoryReallocation.State do
  alias AdventPuzzle.MemoryReallocation.{Reallocator, State}

  defstruct hash_set: MapSet.new(), memory: [], redistribution_cycles: 0, state: :uncycled

  def contains(state, hash),
    do: state
        |> Map.get(:hash_set)
        |> MapSet.member?(hash)

  def next_cycle(%State{memory: memory}=state) do
    state
    |> next_cycle(memory |> Reallocator.reallocate())
  end

  defp next_cycle(state, realocated),
    do: next_cycle(state, realocated, state |> contains(realocated))

  defp next_cycle(state, _realocated, _cycled=true),
      do: %{
            state|
            state: :cycled
          }

  defp next_cycle(%State{redistribution_cycles: value, hash_set: map_set}=state, realocated, _contains=false) do
    %{
      state|
      memory: realocated,
      redistribution_cycles: value+1,
      hash_set: MapSet.put(map_set, realocated)
    }
  end

end
