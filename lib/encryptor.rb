require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/encryption.rb'
require './lib/key'
require './lib/encryptor'
require 'pry'

class EncryptorTest < Minitest::Test

  def test_it_exists
    read = Encryptor.new
    assert_instance_of Encryptor, read
  end

  def test_it_opens_and_reads_contents_of_a_file
    read = Encryptor.new
    read.open_file
    assert_equal "hello", read.read_file
  end

  def test_it_reads_and_writes_to_a_file
    read = Encryptor.new
    read.open_file
    read.read_file
    read.encrypt_file
    assert_equal 5, read.write_to_new_file
  end

  # def test_it_outputs_a_message
  #   read = Encryptor.new
  #   read.open_file
  #   read.read_file
  #   read.encrypt_file
  #   read.write_to_new_file
  #   assert_equal "Created encrypted.txt with the key 12345 and date 280317", read.output_message
  # end
