defmodule AdventPuzzle.InverseCaptcha.HalfwayPairs do
  alias AdventPuzzle.InverseCaptcha.Parser

  def solve(input) do
    input
    |> Parser.parse()
    |> find_captcha()
  end

  defp find_captcha(list) do
    chunk_len = div(length(list), 2)
    [left, right] = Enum.chunk_every(list, chunk_len)
      find_captcha(left, right, 0)
  end

  defp find_captcha([l_head|l_tail], [r_head|r_tail], acc)
    when l_head == r_head, do:
      find_captcha(l_tail, r_tail, acc + l_head)

  defp find_captcha([_r_head|r_tail], [_l_head|l_tail], acc), do:
    find_captcha(r_tail, l_tail, acc)

  defp find_captcha([], [], acc), do: acc * 2

end
