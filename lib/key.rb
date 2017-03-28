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

  def rotation
    if @key == nil
      numbers = random_five_digit_number.to_s
      array_of_numbers = numbers.chars
      rotation = array_of_numbers.map.with_index do |num, index|
        [num, array_of_numbers[index+1]].join.to_i
      end
      rotation.pop
      rotation
    else
      numbers = @key.to_s
      array_of_numbers = numbers.chars
      rotation = array_of_numbers.map.with_index do |num, index|
        [num, array_of_numbers[index+1]].join.to_i
      end
      rotation.pop
      rotation
    end
  end

  def offset
   date = Date.today.strftime "%d%m%y"
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

# key = Key.new("12345")
# binding.pry
# class Key
#   attr_accessor :five_digit_number, :a, :b, :c, :d, :date, :key_collection
#
#   def initialize
#     @five_digit_number = 56789 #need to change this back to f_d_n after testing
#     @date = date
#     @key_collection = []
#     @a = nil
#     @b = nil
#     @c = nil
#     @d = nil
#   end
#
#   def create_five_digit_number
#     @five_digit_number = 10000 + Random.rand(99999-10000)
#   end
#
#   def split_five_digit_number
#     number = five_digit_number.to_s
#     number = number.chars
#     @a = number[0..1].join.to_i
#     @b = number[1..2].join.to_i
#     @c = number[2..3].join.to_i
#     @d = number[3..4].join.to_i
#   end
#
#   def offset
#    @date = Date.today.strftime "%d%m%y"
#    @date = (date.to_i ** 2).to_s
#    @date = date[-4..-1].split('')
#    @date = date.map { |dates| dates.to_i }
#   end
#
#   def add_offset_to_split
#     @a = a + date[0]
#     @b = b + date[1]
#     @c = c + date[2]
#     @d = d + date[3]
#   end
#
#   def create_array
#     @key_collection << a << b << c << d
#   end
#
#   def merge_methods
#     self.split_five_digit_number
#     self.offset
#     self.add_offset_to_split
#     self.create_array
#   end
#
# end

# nk = Key.new
# nk.merge_methods
# binding.pry
# ""
