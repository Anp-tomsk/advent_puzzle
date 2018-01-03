defmodule AdventPuzzle.Maze.State do
  defstruct state: :uncompleted, steps: 0, offset: 0, seq: %{}
  alias AdventPuzzle.Maze.State

  def from_seq(seq) do
    0..length(seq)
    |> Stream.zip(seq)
    |> Enum.into(%{})
    |> fn map_seq -> %State{seq: map_seq} end.()
  end

  def jump(%{state: :complete} = state), do: state

  def jump(state),
    do: jump(state, current_jmp(state))

  defp jump(state, _jmp_value=nil),
    do: %{state| state: :complete}

  defp jump(%{offset: offset, seq: seq, steps: steps} = state, jmp_value) do
    %{
      state |
      seq: seq |> Map.update!(offset, fn item -> item + 1 end),
      steps: steps + 1,
      offset: offset + jmp_value,
    }
  end

  def current_jmp(%State{offset: offset, seq: seq}) do
    seq
    |> Map.get(offset, nil)
  end

end
