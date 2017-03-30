require './lib/decryption'
require './lib/fileio_module'

class Decryptor
  include FileIOModule
  attr_reader :input_file,
              :output_file

  def initialize(rotation=ARGV[2], offset=ARGV[3])
    input_file  = ARGV[0]
    output_file = ARGV[1]
    @rotation   = rotation
    @offset     = offset
  end

  def crypted_file
    decrypted_message = Decryption.new(read_file, @rotation, @offset)
    decrypted_message.create_splits
    decrypted_message.zip_message
    decrypted_message.find_on_char_map
    decrypted_message.codify
  end

  def output_message
    "Created #{ARGV[1]} with the key #{@rotation} and date #{@offset}"
  end

end
