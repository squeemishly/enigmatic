require 'pry'
require 'Date'

class Key
  attr_reader :key, :rotation, :offset, :key_generator

  def initialize(key=nil)
    @key_generator = []
    key == nil ? @key = random_five_digit_number : @key = key.to_i
    @offset = offset
  end

  def random_five_digit_number
    10000 + Random.rand(99999-10000)
  end

  def rotation()
    if @key == nil
      numbers = random_five_digit_number.to_s
    else
      numbers = @key.to_s
    end

    list_of_numbers = numbers.chars
    rotation = list_of_numbers.map.with_index do |num, index|
      [num, list_of_numbers[index+1]].join.to_i
    end
    rotation.pop
    rotation
  end

  def offset(date = (Date.today.strftime "%d%m%y"))
   date_squared = (date.to_i ** 2).to_s
   date_in_a_string = date_squared[-4..-1].split('')
   date_in_a_string.map { |dates| dates.to_i }
  end

  def key_generator
    rotation.map.with_index do |num, index|
      num + offset[index]
    end
  end

end
