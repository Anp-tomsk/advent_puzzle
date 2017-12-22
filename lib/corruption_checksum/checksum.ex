defmodule AdventPuzzle.CorruptionChecksum.Checksum do

  def calculate([], _strategy), do: 0

  def calculate([head|tail], strategy) do
    strategy.checksum(head) + calculate(tail, strategy)
  end

end
