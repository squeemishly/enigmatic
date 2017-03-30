require './lib/key'
require './lib/encryption_methods'

class Encryption
  include EncryptionMethods

  attr_reader :message, :new_key, :char_map, :char_map_match

  def initialize(message, new_key=nil, date=(Date.today.strftime "%d%m%y"))
    new_key == nil ? @new_key = Key.new : @new_key =  Key.new(new_key)
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @message = message
    @char_map_match = []
  end

  def create_key
    new_key.key_generator
  end

end
