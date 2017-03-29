require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/decryption'
require './lib/encryption'
require './lib/key'

#Note: apparently, decrpytion is the hardest word to spell.

class DecryptionTest < Minitest::Test
  def test_it_exists
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    assert_instance_of Decryption, decryptnomicon
  end

  def test_we_can_give_it_message_rotation_and_offset
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    assert_equal "z6o360cb6gov", decryptnomicon.message
    assert_equal "96348", decryptnomicon.rotation
    assert_equal 280317, decryptnomicon.offset
  end

  def test_decrpytnomicon_has_access_to_key_class
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    assert_instance_of Key, decryptnomicon.new_key
  end

  def test_it_can_parse_rotation_to_an_array
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    assert_equal [96, 63, 34, 48], decryptnomicon.unrotate
  end

  def test_it_can_parse_the_date
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    assert_equal [0, 4, 8, 9], decryptnomicon.undatify
  end

  def test_it_can_create_a_key
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    assert_equal [-96, -67, -42, -57], decryptnomicon.create_key
  end

  def test_it_has_a_char_map
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "," , " "], decryptnomicon.char_map
  end

  def test_it_zips_a_message
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    decryptnomicon.create_splits
    decryptnomicon.zip_message
    assert_instance_of String, decryptnomicon.message[0][0]
    assert_instance_of Fixnum, decryptnomicon.message[0][1]
  end

  def test_it_can_find_a_character
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    decryptnomicon.create_splits
    decryptnomicon.zip_message
    decryptnomicon.find_on_char_map
    assert_instance_of Fixnum, decryptnomicon.char_map_match[0]
  end

  def test_it_returns_a_message
    decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
    decryptnomicon.create_splits
    decryptnomicon.zip_message
    decryptnomicon.find_on_char_map
    assert_instance_of String, decryptnomicon.codify
    assert_equal decryptnomicon.message.length, decryptnomicon.codify.length
  end

end
