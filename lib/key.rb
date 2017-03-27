require 'pry'
require 'Date'

class Key
  attr_reader :key, :random_digit_number, :offset

  def initialize
    @key = key
    @random_digit_number = random_five_digit_number
    @offset = offset
  end

  def random_five_digit_number
    10000 + Random.rand(99999-10000)
  end

  def rotation
    numbers = random_five_digit_number.to_s
    array_of_numbers = numbers.chars

    rotation = array_of_numbers.map.with_index do |num, index|
      [num, array_of_numbers[index+1]].join.to_i
    end
    rotation.pop
    rotation
  end

  def offset
   date = Date.today.strftime "%d%m%y"
   date_squared = (date.to_i ** 2).to_s
   date_in_a_string = date_squared[-4..-1].split('')
   date_in_a_string.map { |dates| dates.to_i }
  end

  def key
    rotation.map.with_index do |num, index|
      num + offset[index]
    end
  end

end
