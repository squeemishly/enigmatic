require './lib/key' #take out after testing
require 'pry'

class Encryption
  attr_reader :new_key, :char_map, :char_map_match, :shifted_numbers
  attr_accessor :message

  def initialize(message)
    @new_key = Key.new
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @message = message
    @char_map_match = []
    @shifted_numbers = []
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

  def get_shift_total
    char_map_match.each_index do |index|
      shifted_numbers << (char_map_match[index] + message[index][1])
    end
  end


  def encodify
    coded_message = ""
    shifted_numbers.each do |num|
      coded_message << char_map.rotate(num)[0]
    end
    @message = coded_message
  end

end

message = Encryption.new("Hello, World")
message.create_splits
message.zip_message
message.find_on_char_map
message.get_shift_total
puts message.encodify
