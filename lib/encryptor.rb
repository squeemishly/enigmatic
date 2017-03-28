require 'pry'
require './lib/encryption.rb'
require './lib/key'

class Encryptor

  attr_reader :input_file, :output_file

  def initialize
    input_file = ARGV[0]
    output_file = ARGV[1]
    @encryption_key = nil
  end

  def open_file
    file = File.open(ARGV[0], "r")
  end

  def read_file
    message = open_file.readlines
    message.join("").chomp
  end

  def encrypt_file
    encrypted_message = Encryption.new(read_file)
    @encryption_key = encrypted_message.new_key.key
    encrypted_message.create_splits
    encrypted_message.zip_message
    encrypted_message.find_on_char_map
    encrypted_message.get_shift_total
    encrypted_message.encodify
  end

  def write_to_new_file
    encrypted_file = File.open(ARGV[1], "w+")
    encrypted_file.write(encrypt_file)
  end

  def output_message
    "Created #{ARGV[1]} with the key #{@encryption_key} and date #{Date.today.strftime "%d%m%y"}"
  end

end

  new_file = Encryptor.new
  new_file.open_file
  new_file.read_file
  new_file.encrypt_file
  new_file.write_to_new_file
  puts new_file.output_message
