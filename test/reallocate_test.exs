defmodule AdventPuzzle.ReallocateTest do
  use ExUnit.Case
  alias AdventPuzzle.MemoryReallocation.{ReallocationCycles, Reallocator}

  test "reallocate max value spreaded from left to right" do
    assert [2, 4, 1, 2] == Reallocator.reallocate([0, 2, 7, 0])
    assert [3, 1, 2, 3] == Reallocator.reallocate([2, 4, 1, 2])
    assert [0, 2, 3, 4] == Reallocator.reallocate([3, 1, 2, 3])
    assert [1, 3, 4, 1] == Reallocator.reallocate([0, 2, 3, 4])
    assert [2, 4, 1, 2] == Reallocator.reallocate([1, 3, 4, 1])
  end

  test "reallocation find cycles in 3 steps" do
    state = ReallocationCycles.find_cycles([0, 2, 7, 0])
    assert 4 == state |> Map.get(:redistribution_cycles)
  end

  test "reallocation find cycles in 12840 steps" do
    state = ReallocationCycles.find_cycles([4, 10, 4, 1, 8, 4, 9, 14, 5, 1, 14, 15, 0, 15, 3, 5])
    assert 12840 == state |> Map.get(:redistribution_cycles)
  end

end
