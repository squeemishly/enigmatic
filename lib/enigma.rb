require './lib/encryption'
require './lib/decryption'
require './lib/crack'
require 'pry'

class Enigma

  def encrypt(message, rotation = nil, date=(Date.today.strftime "%d%m%y"))
    encrypted_message = Encryption.new(message, rotation, date)
    encrypted_message.create_splits
    encrypted_message.zip_message
    encrypted_message.find_on_char_map
    encrypted_message.codify
  end

  def decrypt(message, rotation, date=(Date.today.strftime "%d%m%y"))
    decryptify = Decryption.new(message, rotation, date=(Date.today.strftime "%d%m%y"))
    decryptify.create_key
    decryptify.create_splits
    decryptify.zip_message
    decryptify.find_on_char_map
    decryptify.codify
  end

  def crack(message, date=(Date.today.strftime "%d%m%y"))
    cracker = Crack.new(message, date=(Date.today.strftime "%d%m%y"))
    cracker.crack_code
  end
end
