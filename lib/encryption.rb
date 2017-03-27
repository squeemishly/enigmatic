require 'pry'
require './lib/key.rb'

class Encryption
  attr_reader :new_key, :char_map
  attr_accessor :message

  def initialize(message)
    @new_key = Key.new
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @message = message
    @encrypted = ""
  end

  def create_splits
    @message = message.downcase.chars
  end

  def encrypt
    create_splits.each_slice(4) do |slice|
      slice.each_with_index do |message, ind|
        p message_index = @char_map.index(message)
        p @encrypted << @char_map.rotate(@new_key.key[ind])[message_index]
      end
    end
    @encrypted
  end
end

message = Encryption.new("Hello, World")
binding.pry
"------------"

      # message = Encryption.new("Hello, World")
      # # message.create_chars
      # message.new_key.merge_methods
      # split_message = message.create_splits
      # zipped_message = split_message.map do |arr|
      # arr.zip(message.new_key.key_collection)
      # end
      # zipped_message.flatten!(1)
      # new_array = []
      # zipped_message.each_index do |index|
      # new_array << message.char_map.index(zipped_message[index][0])
      # end
      # numbers = []
      # new_array.each_index do |index|
      # numbers << (new_array[index]+zipped_message[index][1])
      # end
      # coded_message = ""
      # numbers.each do |num|
      # coded_message << message.char_map.rotate(num)[0]
      # end
      # puts coded_message
