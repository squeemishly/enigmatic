require 'pry'
require './lib/decryption'

class Crack
  attr_reader :message,
              :date

  def initialize (message, date=(Date.today.strftime "%d%m%y"))
    @message = message
    @date = date
  end

  def crack_code
    rotation = 10000
    temp_message = @message
    until temp_message[-7..-1] == "..end.."
      decryption = Decryption.new(message, rotation.to_s, date)
      temp_message = decryption.merge_methods
      rotation += 1
      p temp_message
    end
    @message = temp_message
  end

end

cracked = Crack.new("90tip1322ekiuv279sx78,l9usi0u6o0n", 290317)
puts cracked.crack_code
