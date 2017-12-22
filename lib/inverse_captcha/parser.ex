defmodule AdventPuzzle.InverseCaptcha.Parser do

  def parse(input) when is_bitstring(input) do
    input
    |> String.codepoints()
    |> Enum.map(&(String.to_integer/1))
  end

end
