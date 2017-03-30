require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_it_encrypts
    e = Enigma.new
    assert_instance_of String, e.encrypt("hello my dearest of friends")
  end

  # def test_it_encrypts_with_a_specific_code
  #   e = Enigma.new
  #   assert_equal "", e.encrypt("hello my dearest of friends", "12345", Date.today)
  # end

  def test_it_decrypts
    e = Enigma.new
    assert_equal "hello, world", e.decrypt("o6rpv0f0vgrh", "46373", Date.today)
  end

  def test_it_decrypts_without_the_date
    e = Enigma.new
    assert_equal "hello, world", e.decrypt("o6rpv0f0vgrh", "46373")
  end

  def test_it_got_a_crack
    e = Enigma.new
    assert_equal "hello, world", e.crack("z6o360cb6gov", 290317)
  end
end
