require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cracked'
require 'pry'

class CrackedTest< Minitest::Test

  def test_it_exists
    cracked = Cracked.new("hello..end..")
    assert_instance_of Cracked, cracked
    cracked.order_of_indexes
  end



  #each encrypted message ends with "..end.."


  # "jw2zqqq.q92r"
  # [41, 18, 56, 92]
  # [41, 14, 48, 83]
  # [0, 4, 8, 9]
  # 41483


end
