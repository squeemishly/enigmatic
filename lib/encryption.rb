require './lib/key' #take out after testing
require 'pry'

class Encryption
  attr_reader :new_key, :char_map
  attr_accessor :message
  def initialize(message)
    @new_key = Key.new
    @char_map = ('a'..'z').to_a + (1..9).to_a + ['.', ',', ' ']
    @message = message
  end

  def create_chars
    @message = message.chars
  end

  def create_splits(message)
    message = message.chars.each_slice(4).to_a
  end
end

message = Encryption.new("Hello, World")
message.create_chars
#split_message = message.create_splits("Hello, World")


binding.pry
""
