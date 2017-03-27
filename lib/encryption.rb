require './lib/key' #take out after testing
require 'pry'

class Encryption
  attr_reader :new_key, :char_map, :char_map_match
  attr_accessor :message

  def initialize(message)
    @new_key = Key.new
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @message = message
    @char_map_match = []
  end

  def create_splits
    @message = message.downcase.chars.each_slice(4).to_a
  end

  def zip_message
    @message = message.map do |arr|
      arr.zip(new_key.key)
    end
    @message.flatten!(1)
  end

  def find_on_char_map
    message.each_index do |index|
      char_map_match << char_map.index(message[index][0])
    end
  end

end

# message = Encryption.new("Hello, World")
# split_message = message.create_splits
#
# zipped_message = split_message.map do |arr|
#   arr.zip(message.new_key.key)
# end
# zipped_message.flatten!(1)
#
# new_array = []
# zipped_message.each_index do |index|
#   new_array << message.char_map.index(zipped_message[index][0])
# end
#
# numbers = []
# new_array.each_index do |index|
#   numbers << (new_array[index]+zipped_message[index][1])
# end
#
# coded_message = ""
# numbers.each do |num|
#   coded_message << message.char_map.rotate(num)[0]
# end
#
# puts coded_message
#
# binding.pry
# ""
