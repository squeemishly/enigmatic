require 'pry'
require 'date'
require './lib/encryption_methods'

class Crack
  include EncryptionMethods
  attr_reader :message,
              :date,
              :char_map,
              :char_map_match,
              :last_four_digits,
              :create_key

  def initialize (message, date=(Date.today.strftime "%d%m%y"))
    @message = message
    @date = date
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @last_four_digits = nil
    @char_map_match = []
    @comparison_values = ['n', 'd', '.', '.']
    @create_key = []
  end

  def last_four
    @last_four_digits = message[-4..-1]
    @last_four_digits = last_four_digits.chars
  end

  def find_on_char_map #we can use encryption_methods if we make each letter an array of an array...
    last_four_digits.each_index do |index|
      char_map_match << char_map.index(last_four_digits[index])
    end
    char_map_match
  end

  def find_rotation_values
    char_map_match.each_index do |index|
      count = 0
      temp_char_map = char_map
      until temp_char_map[char_map_match[index]] == @comparison_values[index]
        count += 1
        temp_char_map = temp_char_map.rotate(1)
      end
      @create_key << count
    end
    create_key
  end

  def reverse_key
    @create_key = create_key.reverse
  end

  def reverse_message
    @message = message.reverse
  end

  def cracker
    rotated_char_map = []
    cracked_message = []
    message.each_index do |index|
      rotated_char_map = char_map.rotate(message[index][1])
      cracked_message << rotated_char_map[char_map_match[index]]
    end
    cracked_message.join('')
  end

end


cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
cracked.last_four
cracked.find_on_char_map
cracked.find_rotation_values
cracked.reverse_key
cracked.reverse_message
cracked.create_splits
cracked.zip_message
binding.pry
p cracked.cracker
#
binding.pry
""
