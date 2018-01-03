defmodule AdventPuzzle.Maze.Parser do

  @new_line ~r{(\r\n\|\r|\n)}

  def parse(input) do
    input
    |> String.trim()
    |> String.split(@new_line)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&(String.to_integer/1))
  end

end
