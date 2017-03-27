require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/encryption.rb'
require './lib/key'

class EncryptionTest < Minitest::Test
  def test_it_exists
    message = Encryption.new("Hello, World")
    assert_instance_of Encryption, message
  end

  def test_has_access_to_key_file
    message = Encryption.new("Hello, World")
    assert_instance_of Key, message.new_key
  end

  def test_it_has_access_to_Key_methods
    message = Encryption.new("Hello, World")
    message.new_key.split_five_digit_number
    assert_equal 56, message.new_key.a
    assert_equal 67, message.new_key.b
    assert_equal 78, message.new_key.c
    assert_equal 89, message.new_key.d
  end

  def test_it_breaks_up_text_into_groups_of_4
    message = Encryption.new("Hello, World")
    assert_equal [["h", "e", "l", "l"], ["o", ",", " ", "w"], ["o", "r", "l", "d"]], message.create_splits
  end

  def test_we_have_char_map
    message = Encryption.new("Hello, World")
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "," , " "], message.char_map
  end

  def test_
    message = Encryption.new("Hello, World")
  end

  def test_
    message = Encryption.new("Hello, World")
  end

end
