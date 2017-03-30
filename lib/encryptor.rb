require './lib/encryption.rb'
require './lib/key'
require './lib/fileio_module'

class Encryptor
  include FileIOModule
  attr_reader :input_file,
              :output_file

  def initialize
    input_file = ARGV[0]
    output_file = ARGV[1]
    @encryption_key = nil
  end

  def crypted_file
    encrypted_message = Encryption.new(read_file)
    @encryption_key = encrypted_message.new_key.key
    encrypted_message.create_splits
    encrypted_message.zip_message
    encrypted_message.find_on_char_map
    encrypted_message.codify
  end

  def output_message
    "Created #{ARGV[1]} with the key #{@encryption_key} and date #{Date.today.strftime "%d%m%y"}"
  end

end

e = Encryptor.new
e.open_file
e.read_file
e.write_to_new_file
puts e.output_message
