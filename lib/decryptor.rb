require 'pry'
require './lib/decryption'

class Decryptor
  attr_reader :input_file, :output_file

  def initialize(rotation, offset)
    input_file = ARGV[0]
    output_file = ARGV[1]
    @rotation = rotation
    @offset = offset
  end

  def open_file
    file = File.open(ARGV[0], "r")
  end

  def read_file
    message = open_file.readlines
    message.join("").chomp
  end

  def decrypt_file
    decrypted_message = Decryption.new(read_file, @rotation, @offset)
    decrypted_message.create_splits
    decrypted_message.zip_message
    decrypted_message.find_on_char_map
    decrypted_message.decodify
  end

  def write_to_new_file
    decrypted_file = File.open(ARGV[1], "w+")
    decrypted_file.write(decrypt_file)
  end

  def output_message
    "Created #{ARGV[1]} with the key #{@rotation} and date #{@offset}"
  end

  end

  new_file = Decryptor.new("71188", 290317)
  new_file.open_file
  new_file.read_file
  new_file.decrypt_file
  new_file.write_to_new_file
  puts new_file.output_message
