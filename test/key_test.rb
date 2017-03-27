require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require 'Date'

class KeyTest < Minitest::Test

  def test_it_exists
    new_key = Key.new
    assert_instance_of Key, new_key
  end

  def test_it_creates_random_values
    new_key = Key.new
    assert_instance_of Fixnum, new_key.random_five_digit_number
  end

  def test_it_splits_the_numbers_to_values
    new_key = Key.new
    expected = new_key.rotation
    assert_instance_of Array, expected
    assert_equal 4, expected.length
    expected.each do |num|
      assert_instance_of Fixnum, num
    end
  end

  def test_last_four_digits_of_date_squared_is_the_offset
    new_key = Key.new
    assert_equal [0, 4, 8, 9], new_key.offset
  end

  def test_offset_combines_rotation_and_last_digits_of_date
    new_key = Key.new
    expected = new_key.offset
    assert_instance_of Array, expected
    assert_equal 4, new_key.offset.length
    expected.each do |num|
      assert_instance_of Fixnum, num
    end
  end

end



#
# class KeyTest < Minitest::Test
#   def test_it_exists
#     new_key = Key.new
#     assert_instance_of Key, new_key
#   end
#
#   def test_it_creates_random_values
#     new_key = Key.new
#     assert_instance_of Fixnum, new_key.create_five_digit_number
#   end
#
#   def test_it_splits_the_numbers_to_values
#     new_key = Key.new
#     new_key.split_five_digit_number
#     assert_equal 56, new_key.a
#     assert_equal 67, new_key.b
#     assert_equal 78, new_key.c
#     assert_equal 89, new_key.d
#   end
#
#   def test_last_four_digits_of_date_squared_is_the_offset
#     new_key = Key.new
#     assert_equal [0, 4, 8, 9], new_key.offset
#   end
#
#   def test_add_ABCD_together
#     new_key = Key.new
#     new_key.split_five_digit_number
#     new_key.offset
#     new_key.add_offset_to_split
#     assert_equal 56, new_key.a
#     assert_equal 71, new_key.b
#     assert_equal 86, new_key.c
#     assert_equal 98, new_key.d
#   end
#
#   def test_we_have_an_array_of_ABCD
#     new_key = Key.new
#     new_key.split_five_digit_number
#     new_key.offset
#     new_key.add_offset_to_split
#     assert_equal [56, 71, 86, 98], new_key.create_array
#   end
# end
