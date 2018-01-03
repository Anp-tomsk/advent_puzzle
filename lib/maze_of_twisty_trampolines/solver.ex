defmodule AdventPuzzle.Maze.Solver do
  alias AdventPuzzle.Maze.{State, StatePresenter, Parser}

  def solve(input) when is_bitstring(input) do
    Parser.parse(input)
    |> State.from_seq()
    |> solve()
  end

  def solve(%State{state: :uncompleted}=state) do
    state
    |> State.jump()
    |> solve()
  end

  def solve(%State{state: :complete} = state),
    do: StatePresenter.repr_info(state)

end
