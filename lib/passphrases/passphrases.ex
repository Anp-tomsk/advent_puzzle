defmodule AdventPuzzle.Passphrases do
  alias AdventPuzzle.Passphrases.Parser

  def valid_count(input) do
    input
    |> Parser.parse()
    |> Enum.count(fn phrases -> is_valid?(phrases) end)
  end

  def valid_count(input, :chars_count) do
    input
    |> Parser.parse(:chars_count)
    |> Enum.count(fn phrases -> is_valid?(phrases) end)
  end

  def is_valid?([]), do: false

  def is_valid?(phrases) when is_list(phrases) do
    phrases
    |> MapSet.new()
    |> MapSet.size()
    |> fn unique_keys ->
      unique_keys == length(phrases)
    end.()
  end

  def is_valid?(line) when is_bitstring(line) do
    line
    |> Parser.parse()
    |> Enum.any?(fn phrases -> is_valid?(phrases) end)
  end


end
