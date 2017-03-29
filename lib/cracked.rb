require 'pry'

class Cracked
  attr_reader :char_map,
              :message,
              :end

  def initialize(message)
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
    @message = message
    @end = 'end.'
  end

  def order_of_indexes
    length_of_message = message.length
    binding.pry
    length_of_message % 4 ==0
      3,0,1,2
            3
      2,3,0,1
            2
      1,2,3,0
      [nd.e]
            1
      0,1,2,3
      [end.]

      [1,6,3,9]
      # order @end by the numbers in the array_of_numbers
      # then rotate the encryption to match @end
      # each rotation with equal the 4 values offsets for the encrytption...
  end

end

#find length of the message
# then figure out what indexes last 4 represent
# get the last six chars of the message
# remove the last one
# so that we have an array of 4 distinct chars
# find the "conversion" of those 4
