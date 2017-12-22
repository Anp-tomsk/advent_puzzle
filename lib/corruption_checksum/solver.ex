defmodule AdventPuzzle.CorruptionChecksum.Solver do
  alias AdventPuzzle.CorruptionChecksum.{Parser, Checksum, MinMaxChecksum, EvenlyDividedChecksum}

  def solve(input), do:
    solve(input, :min_max)

  def solve(input, :min_max), do:
    solve(input, MinMaxChecksum)

  def solve(input, :evenly_divided), do:
    solve(input, EvenlyDividedChecksum)

  def solve(input, strategy) do
    input
    |> Parser.parse()
    |> Checksum.calculate(strategy)
  end


end
