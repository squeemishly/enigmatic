module EncryptionMethods

  def create_splits
    @message = message.downcase.chars.each_slice(4).to_a
  end

  def find_on_char_map ###
    message.each_index do |index|
      char_map_match << char_map.index(message[index][0])
    end
    char_map_match
  end

  def codify ###
    rotated_char_map = []
    encoded_message = []
    message.each_index do |index|
      rotated_char_map = char_map.rotate(message[index][1])
      encoded_message << rotated_char_map[char_map_match[index]]
    end
    encoded_message.join('')
  end

  def zip_message
    @message = message.map do |arr|
      arr.zip(create_key)
    end
    @message.flatten!(1)
  end

end
