defmodule AdventPuzzle.CorruptionChecksum.Parser do

  @new_line ~r{(\r\n\|\r|\n)}

  def parse(input) do
    input
    |> String.split(@new_line)
    |> Enum.map(&(parse_line/1))
  end

  defp parse_line(line) do
    line
    |> String.split()
    |> Enum.map(&(String.to_integer/1))
  end

end
