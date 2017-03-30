require 'date'
require './lib/crack'
require './lib/fileio_module'

class Cracker
  include FileIOModule
  attr_reader :input_file,
              :output_file

  def initialize(date=(Date.today.strftime "%d%m%y"))
    @input_file  = ARGV[0]
    @output_file = ARGV[1]
    @date = date
    @rotation = nil
  end


  def crypted_file
    cracking = Crack.new(read_file, @date)
    puts "Created '#{ARGV[1]}' with the cracked key #{cracking.rotation} and date #{@date}"
    cracking.crack_code
  end

end
