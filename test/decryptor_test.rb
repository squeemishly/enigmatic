require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/decryptor'
require './lib/decryption'
require './lib/key'

class DecryptorTest < Minitest::Test
  def test_it_exists
    decryptify = Decryptor.new("71188", 290317)
    assert_instance_of Decryptor, decryptify
  end

  def test_it_opens_and_reads_contents_of_a_file
    decryptify = Decryptor.new("71188", 290317)
    decryptify.open_file
    assert_equal "at,4h", decryptify.read_file
  end

  def test_it_reads_and_writes_to_a_file
    decryptify = Decryptor.new("71188", 290317)
    decryptify.open_file
    decryptify.read_file
    decryptify.decrypt_file
    assert_equal 5, decryptify.write_to_new_file
  end

end
