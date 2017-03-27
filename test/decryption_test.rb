require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/decryption'
require './lib/encryption'
require './lib/key'

#Note: apparently, decrpytion is the hardest word to spell.

class DecryptionTest < Minitest::Test
  def test_it_exists
    decryptnomicon = Decryption.new(",oeths8uyd7a", 83064, 270317)
    assert_instance_of Decryption, decryptnomicon
  end

  def test_we_can_give_it_text_rotation_and_offset
    decryptnomicon = Decryption.new(",oeths8uyd7a", 83064, 270317)
    assert_equal ",oeths8uyd7a", decryptnomicon.text
    assert_equal 83064, decryptnomicon.rotation
    assert_equal 270317, decryptnomicon.offset
  end

  def test_decrpytnomicon_has_access_to_key_class
    decryptnomicon = Decryption.new(",oeths8uyd7a", 83064, 270317)
    assert_instance_of Key, decryptnomicon.new_key
  end

  def test_it_can_parse_rotation_to_an_array
    decryptnomicon = Decryption.new(",oeths8uyd7a", 83064, 270317)
    assert_equal [83, 30, 06, 64], decryptnomicon.unrotate
  end

  def test_it_can_parse_the_date
    decryptnomicon = Decryption.new(",oeths8uyd7a", 83064, 270317)
    assert_equal [0, 4, 8, 9], decryptnomicon.undatify
  end

  def test_it_can_merge_the_rotation_and_the_offset
    decryptnomicon = Decryption.new(",oeths8uyd7a", 83064, 270317)
    assert_equal [83, 34, 14, 73], decryptnomicon.create_key
  end

  def test_it_has_a_char_map
    decryptnomicon = Decryption.new(",oeths8uyd7a", 83064, 270317)
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "," , " "], decryptnomicon.char_map
  end

  def test_
  end

end
