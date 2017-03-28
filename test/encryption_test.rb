require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/encryption.rb'
require './lib/key'
require 'pry'

class EncryptionTest < Minitest::Test
  def test_it_exists
    message = Encryption.new("Hello, World")
    assert_instance_of Encryption, message
  end

  def test_has_access_to_key_file
    message = Encryption.new("Hello, World")
    assert_instance_of Key, message.new_key
  end

  def test_it_breaks_up_message_into_groups_of_4
    message = Encryption.new("Hello, World")
    assert_equal [["h", "e", "l", "l"], ["o", ",", " ", "w"], ["o", "r", "l", "d"]], message.create_splits
  end
  
  def test_we_have_char_map
    message = Encryption.new("Hello, World")
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "," , " "], message.char_map
  end

  def test_types_of_values
    message = Encryption.new("Hello, World")
    message.create_splits
    message.zip_message
    assert_instance_of String, message.message[0][0]
    assert_instance_of Fixnum, message.message[0][1]
  end

  def test_it_matches_the_message_to_the_char_map
    message = Encryption.new("Hello, World")
    message.create_splits
    message.zip_message
    message.find_on_char_map
    assert_instance_of Fixnum, message.char_map_match[0]
  end

  def test_we_get_total_we_shift_each_letter_by
    message = Encryption.new("Hello, World")
    message.create_splits
    message.zip_message
    message.find_on_char_map
    message.get_shift_total
    assert_instance_of Fixnum, message.get_shift_total[0]
  end

  def test_we_get_an_awesome_coded_message_like_a_boss
    message = Encryption.new("Hello, World")
    message.create_splits
    message.zip_message
    message.find_on_char_map
    message.get_shift_total
    assert_instance_of String, message.encodify
  end


end
