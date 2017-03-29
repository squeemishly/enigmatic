require 'pry'
require './lib/key'

class Decryption
  attr_reader :message, :rotation, :offset, :new_key, :char_map, :char_map_match, :decoded_message

  def initialize(message, rotation, offset)
    @message = message
    @rotation = rotation
    @offset = offset
    @new_key = Key.new
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @char_map_match = []
    @decoded_message = nil
  end

  def unrotate
    numbers = @rotation.chars
    rotated = numbers.map.with_index do |num, index|
      [num, numbers[index+1]].join.to_i
    end
    rotated.pop
    rotated
  end

  def undatify
    new_key.offset(offset)
  end

  def create_key
    unrotate.map.with_index do |num, index|
      (num + undatify[index]) * -1
    end
  end

  def create_splits ####
    @message = message.chars.each_slice(4).to_a
  end

  def zip_message
    @message = message.map do |arr|
      arr.zip(create_key)
    end
    @message.flatten!(1)
  end

  def find_on_char_map ###
    message.each_index do |index|
      char_map_match << char_map.index(message[index][0])
    end
  end

  def decodify ### 
    rotated_char_map = []
    decoded_message = []
    message.each_index do |index|
      rotated_char_map = char_map.rotate(message[index][1])
      decoded_message << rotated_char_map[char_map_match[index]]
    end
    @decoded_message = decoded_message.join('')
  end

end

# decryptnomicon = Decryption.new("z6o360cb6gov", "96348", 280317)
# p decryptnomicon.create_key
# p decryptnomicon.create_splits
# p decryptnomicon.zip_message
# p decryptnomicon.find_on_char_map
# p decryptnomicon.decodify
# binding.pry
