require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cracker'

class CrackerTest < Minitest::Test
  def test_it_exists
    cracker = Cracker.new
    assert_instance_of Cracker, cracker
  end

  def test_it_has_some_files
    cracker = Cracker.new
    assert_equal "90tip1322ekiuv279sx78,l9usi0u6o0n", cracker.read_file
  end

  def test_it_can_crack_a_message
    cracker = Cracker.new
    assert_equal "this is my secret message ..end..", cracker.crypted_file
  end

  def test_it_writes_to_a_file
    cracker = Cracker.new
    cracker.crypted_file
    assert_equal 33, cracker.write_to_new_file
  end
end
