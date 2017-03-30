require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_it_exists
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    assert_instance_of Crack, cracked
  end

  def test_it_can_access_our_message
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    assert_equal "90tip1322ekiuv279sx78,l9usi0u6o0n", cracked.message
    assert_equal 290317, cracked.date
  end

  def test_it_can_pull_the_last_four_characters
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    assert_equal ["6", "o", "0", "n"], cracked.last_four
  end

  def test_it_has_a_char_map
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "," , " "], cracked.char_map
  end

  def test_it_finds_where_the_characters_are_on_char_map
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    cracked.last_four
    assert_equal [32, 14, 26, 13], cracked.find_on_char_map
  end

  def test_it_finds_the_rotation_values
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    cracked.last_four
    cracked.find_on_char_map
    assert_equal [20, 28, 10, 23], cracked.find_rotation_values
  end

  def test_it_can_reverse_the_key
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    cracked.last_four
    cracked.find_on_char_map
    cracked.find_rotation_values
    assert_equal [23, 10, 28, 20], cracked.reverse_key
  end

  def test_it_reverses_the_message
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    assert_equal "n0o6u0isu9l,87xs972vuike2231pit09", cracked.reverse_message
  end

  def test_it_splits_the_encrypted_message
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    cracked.reverse_message
    assert_equal [["n", "0", "o", "6"], ["u", "0", "i", "s"], ["u", "9", "l", ","], ["8", "7", "x", "s"], ["9", "7", "2", "v"], ["u", "i", "k", "e"], ["2", "2", "3", "1"], ["p", "i", "t", "0"], ["9"]], cracked.create_splits
  end

  def test_it_cracks_the_message
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    cracked.last_four
    cracked.find_on_char_map
    cracked.find_rotation_values
    cracked.reverse_key
    cracked.reverse_message
    cracked.create_splits
    cracked.zip_message
    assert_equal "__", cracked.cracker
  end

end
