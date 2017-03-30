require 'date'
require './lib/crack'

class Cracker
  attr_reader :input_file,
              :output_file

  def initialize(date=(Date.today.strftime "%d%m%y"))
    @input_file  = ARGV[0]
    @output_file = ARGV[1]
    @date = date
    @rotation = nil
  end

  def open_file
    file = File.open(ARGV[0], "r")
  end

  def read_file
    message = open_file.readlines
    message.join("").chomp
  end

  def crack_that_message
    cracking = Crack.new(read_file, @date)
    puts "Created '#{ARGV[1]}' with the cracked key #{cracking.rotation} and date #{@date}"
    cracking.crack_code
  end

  def write_to_new_file
    new_file = File.open(ARGV[1], "w")
    new_file.write(crack_that_message)
  end
end
