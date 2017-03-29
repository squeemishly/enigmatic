require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_it_exists
    cracked = Crack.new("at,4h", 290317)
    assert_instance_of Crack, cracked
  end

  def test_it_can_access_our_message
    cracked = Crack.new("at,4h", 290317)
    assert_equal "at,4h", cracked.message
    assert_equal 290317, cracked.date
  end

  def test_it_has_a_char_map
    cracked = Crack.new("at,4h", 290317)
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "," , " "], cracked.char_map
  end

  def test_it_splits_the_encrypted_message
    
  end

  def test_it_finds_a_character_on_the_char_map
    cracked = Crack.new("at,4h", 290317)

  end

end
