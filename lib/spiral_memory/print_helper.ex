defmodule AdventPuzzle.SpiralMemory.PrintHelper do

  def square_for(number) do
    0..number
    |> Enum.reverse()
  end

end
