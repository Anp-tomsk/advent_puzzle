defmodule AdventPuzzle.SpiralMemory do
  require Integer

  def find_steps(number) do
    number
    |> nearest_outer_square()
    |> calculate_steps(number)
  end

  def calculate_steps(outer_square, number) do
    sqrt = trunc(:math.sqrt(outer_square))
    steps = trunc(sqrt/2)
    reminder = (rem(number - (sqrt - 2) * (sqrt - 2), sqrt - 1) - 1)

    steps..round(sqrt - 1)
    |> Enum.to_list()
    |> get_steps()
    |> Enum.fetch!(reminder)
  end

  def get_steps([head|tail]) do
    [_|left_side] = Enum.reverse(tail)
    left_side ++ [head|tail]
  end

  def nearest_outer_square(number) do
    0..10000
    |> Stream.filter(&Integer.is_odd/1)
    |> Stream.map(fn x -> :math.pow(x, 2) end)
    |> Enum.find(-1, fn val -> val >= number end)
    |> handle_search()
    |> fn {:ok, finded_value} -> finded_value end.()
  end

  def handle_search(_finded_value=-1), do: {:error, :not_found}
  def handle_search(finded_value), do: {:ok, finded_value}

end
