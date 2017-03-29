require 'pry'

class Crack
  attr_reader :message, :date, :char_map

  def initialize (message, date = (Date.today.strftime "%d%m%y"))
    @message = message
    @date = date
    @char_map = ('a'..'z').to_a + ("0".."9").to_a + ['.', ',', ' ']
  end


end
