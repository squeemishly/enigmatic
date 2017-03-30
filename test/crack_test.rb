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

  def test_it_can_create_the_offset
    cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
    assert_equal [0,4,8,9], cracked.undatify
  end
end
