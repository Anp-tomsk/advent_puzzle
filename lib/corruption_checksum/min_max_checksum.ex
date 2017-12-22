defmodule AdventPuzzle.CorruptionChecksum.MinMaxChecksum do

  def checksum(list), do:
    Enum.max(list) - Enum.min(list)

end
