require 'pry'
require './lib/key'

class Decryption
  attr_reader :text, :rotation, :offset, :new_key, :char_map

  def initialize(text, rotation, offset)
    @text = text
    @rotation = rotation
    @offset = offset
    @new_key = Key.new
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
  end

  def unrotate
    new_key.rotation(rotation)
  end

  def undatify
    new_key.offset(offset)
  end

  def create_key
    unrotate.map.with_index do |num, index|
      num + undatify[index]
    end
  end


end
