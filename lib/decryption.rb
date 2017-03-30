require './lib/key'
require './lib/encryption_methods'

class Decryption

  include EncryptionMethods
  attr_reader :message,
              :rotation,
              :offset,
              :new_key,
              :char_map,
              :char_map_match

  def initialize(message, rotation, offset)
    @message = message
    @rotation = rotation
    @offset = offset
    @new_key = Key.new(offset)
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @char_map_match = []
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

  def merge_methods
    create_key
    create_splits
    zip_message
    find_on_char_map
    codify
  end

end
