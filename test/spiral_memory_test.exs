defmodule SpiralMemoryTest do
  use ExUnit.Case
  alias AdventPuzzle.SpiralMemory

  test "find steps for 1 return 0" do
    assert 1 == SpiralMemory.nearest_outer_square(1)
  end

  test "find nearest odd square for 12" do
    assert 25 == SpiralMemory.nearest_outer_square(12)
  end

  test "find nearest odd square for 289326" do
    assert 290521 == SpiralMemory.nearest_outer_square(289326)
    assert 419 == SpiralMemory.find_steps(289326)
  end

  test "find steps 12 equals 3" do
    assert 3 == SpiralMemory.find_steps(12)
  end

  test "find steps 23 equals 2" do
    assert 2 == SpiralMemory.find_steps(23)
  end

  test "find steps 1024 equals 31" do
    assert 1089 == SpiralMemory.nearest_outer_square(1024)
    sqrt = :math.sqrt(1089)
    assert 33 == sqrt
    steps = trunc(sqrt/2)
    assert 16 == steps
    arr =   steps..round(sqrt - 1) |> Enum.to_list()
    assert [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32] ==
      arr
    result = SpiralMemory.get_steps([1, 2, 3])
    assert [2, 1, 2, 3] = result
    assert 31 == SpiralMemory.find_steps(1024)
  end

end
