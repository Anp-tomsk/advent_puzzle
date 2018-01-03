defmodule MazeOfTwistyTrampolinesTest do
  use ExUnit.Case
  alias AdventPuzzle.Maze.{State, Parser, StatePresenter, Solver}

  test "parse input" do
    input = "0
3
0
1
-3"
    assert [0, 3, 0, 1, -3] == Parser.parse(input)
  end

  test "init state from seq" do
    seq =
      [0, 3, 0, 1, -3]
      |> State.from_seq()
    assert %State{seq: %{0 => 0, 1 => 3, 2=>0, 3=>1, 4=>-3}} = seq
  end

  test "increment at update seq" do
    incremented_seq =
      [0, 3]
      |> State.from_seq()
      |> State.jump()

    assert %State{seq: %{0 => 1, 1 => 3}} = incremented_seq
  end

  test "repr items test" do
    maze_state =
      [0, 3, 0, 1, -3]
      |> State.from_seq()

    assert "UNCOMPLETED [0]: (0) 3 0 1 -3" == StatePresenter.repr(maze_state)

    maze_state = State.jump(maze_state)
    assert "UNCOMPLETED [1]: (1) 3 0 1 -3" == StatePresenter.repr(maze_state)

    maze_state = State.jump(maze_state)
    assert "UNCOMPLETED [2]: 2 (3) 0 1 -3" == StatePresenter.repr(maze_state)

    maze_state = State.jump(maze_state)
    assert "UNCOMPLETED [3]: 2 4 0 1 (-3)" == StatePresenter.repr(maze_state)

    maze_state = State.jump(maze_state)
    assert "UNCOMPLETED [4]: 2 (4) 0 1 -2" == StatePresenter.repr(maze_state)

    maze_state = State.jump(maze_state)
    assert "UNCOMPLETED [5]: 2 5 0 1 -2" == StatePresenter.repr(maze_state)

    maze_state = State.jump(maze_state)
    assert "COMPLETED [5]: 2 5 0 1 -2" == StatePresenter.repr(maze_state)

  end

  test "maze solver" do
    input = "0
            3
            0
            1
            -3"
    assert "Maze completed in 5 steps" == Solver.solve(input)
  end

  test "maze solver big input" do
    input = File.read!("test/fixtures/maze")
    assert "Maze completed in 373543 steps" == Solver.solve(input)
  end

end
