defmodule AdventPuzzle.InverseCaptcha.NearestPairs do
  alias AdventPuzzle.InverseCaptcha.Parser

  def solve(input) do
    input
    |> Parser.parse()
    |> circulize()
    |> find_captcha()
  end

  defp find_captcha([head | tail]) do
    find_captcha(tail, head, [])
  end

  defp find_captcha([head|tail], curr, chain) when head == curr, do:
    find_captcha(tail, head, [curr|chain])

  defp find_captcha([head|tail], _curr, chain), do:
    find_captcha(tail, head, chain)

  defp find_captcha([], _curr, chain), do: Enum.sum(chain)

  defp circulize([head|tail]), do: [head|tail] ++ [head]

end
