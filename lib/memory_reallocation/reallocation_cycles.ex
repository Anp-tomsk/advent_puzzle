defmodule AdventPuzzle.MemoryReallocation.ReallocationCycles do
  alias AdventPuzzle.MemoryReallocation.State

  def find_cycles(arr) when is_list(arr),
      do: %State{memory: arr} |> find_cycles()

  def find_cycles(%State{state: :cycled}=state), do: state

  def find_cycles(%State{}=state) do
    state
    |> State.next_cycle()
    |> find_cycles()
  end

end
