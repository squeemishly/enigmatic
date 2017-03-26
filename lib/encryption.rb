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

  # def create_chars
  #   @message = message.chars
  # end

  def create_splits
    @message = message.downcase.chars.each_slice(4).to_a
  end


end

message = Encryption.new("Hello, World")
# message.create_chars
message.new_key.merge_methods
split_message = message.create_splits
zipped_message = split_message.map do |arr|
  arr.zip(message.new_key.key_collection)
end
zipped_message.flatten!(1)
new_array = []
zipped_message.each_index do |index|
  new_array << message.char_map.index(zipped_message[index][0])
end

#message.char_map.rotate(new_array[0]+zipped_message[0][1])[0]

binding.pry
""
