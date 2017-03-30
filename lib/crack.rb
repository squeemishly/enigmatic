require './lib/decryption'

class Crack
  attr_reader :message,
              :date,
              :rotation

  def initialize (message, date=(Date.today.strftime "%d%m%y"))
    @message = message
    @date = date
    @rotation = 10000
  end

  def crack_code
    temp_message = @message
    until temp_message[-7..-1] == "..end.."
      decryption = Decryption.new(message, rotation.to_s, date)
      temp_message = decryption.merge_methods
      @rotation += 1
      p temp_message
    end
    @message = temp_message
  end

end
