defmodule AdventPuzzle.Passphrases.Parser do

  @new_line ~r{(\r\n\|\r|\n)}

  def parse(input) do
    input
    |> String.split(@new_line)
    |> Enum.map(&String.split/1)
  end

  def parse(input, :chars_count) do
    input
    |> String.split(@new_line)
    |> Enum.map(&String.split/1)
    |> Enum.map(fn chars -> char_count(chars) end)
  end

  def char_count(chars) do
    chars
    |> Enum.map(
    fn str ->
      str
      |> String.graphemes()
      |> Enum.sort()
      |> Enum.join("")
    end)
  end

end
