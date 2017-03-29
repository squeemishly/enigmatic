require 'pry'
require './lib/key'
require './lib/encryption_methods'

class Encryption
  include EncryptionMethods

  attr_reader :message, :new_key, :char_map, :char_map_match

  def initialize(message, new_key=nil)
    new_key == nil ? @new_key = Key.new : @new_key =  Key.new(new_key)
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @message = message
    @char_map_match = []
  end

  def create_key
    new_key.key_generator
  end

end

# message = Encryption.new("Hello, World")
# p message.create_splits
# p message.zip_message
# message.find_on_char_map
# p x = message.codify
# p x
# p message.new_key.key_generator
# p message.new_key.rotation
# p message.new_key.offset
# p message.new_key.key