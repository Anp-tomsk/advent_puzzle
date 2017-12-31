defmodule PassphrasesTest do
  use ExUnit.Case
  alias AdventPuzzle.Passphrases

  test "valid passphrase" do
    assert true == Passphrases.is_valid?("aa bb cc dd ee")
  end

  test "invalid passphrases" do
    assert false == Passphrases.is_valid?("aa bb cc dd aa")
  end

  test "valid count test" do
    assert 1 == Passphrases.valid_count("aa bb cc dd ee
                                         aa bb cc dd aa")
  end

  test "valid count big input" do
    body = File.read!("test/fixtures/passphrases")
    assert 466 == Passphrases.valid_count(body)
  end

  test "chars count valid passphrase" do
    assert 2 == Passphrases.valid_count("abcde fghij
                                         a ab abc abd abf abj", :chars_count)
  end

  test "chars count invalid passpgrase" do
    assert 0 == Passphrases.valid_count("abcde xyz ecdab", :chars_count)
  end


end
