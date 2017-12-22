defmodule AdventPuzzle.CorruptionChecksum.EvenlyDividedChecksum do

  def checksum([]), do: 0

  def checksum(list) do
    list
    |> Enum.sort()
    |> evenly_divided()
    |> fn {:ok, divisor, dividend} ->
      div(dividend, divisor)
     end.()
  end

  def evenly_divided([]), do: {:error, :not_found}

  def evenly_divided([head|tail]) do
    tail
    |> Enum.find(-1, fn value -> rem(value, head) == 0 end)
    |> handle_search(head, tail)
  end

  def handle_search(_dividend = -1, _divisor, tail) do
    evenly_divided(tail)
  end

  def handle_search(dividend, divisor, _tail), do:
    {:ok, divisor, dividend}


end
