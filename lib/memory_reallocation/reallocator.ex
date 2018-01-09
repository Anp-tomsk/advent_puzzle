defmodule AdventPuzzle.MemoryReallocation.Reallocator do

  def reallocate(memory) do
    max = memory
          |> Enum.max()
    max_index = memory
                |> Enum.find_index(fn val -> val == max end)

     0..length(memory)
     |> Enum.zip(memory)
     |> Enum.into(%{})
     |> Map.update!(max_index, fn _ -> 0 end)
     |> reallocate(max_index+1, max)
  end

  defp reallocate(map, _index, _accamulated=0),
    do: map |> Map.values()

  defp reallocate(map, index, accamulated) when map_size(map) <= index,
    do: map
        |> Map.update!(0, fn value -> value + 1 end)
        |> reallocate(1, accamulated - 1)

  defp reallocate(map, index, accamulated) when map_size(map) > index,
    do: map
        |> Map.update!(index, fn value -> value + 1 end)
        |> reallocate(index + 1, accamulated - 1)

end
