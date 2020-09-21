require 'date'
require './lib/encrypt'
require './lib/decrypt'

class Enigma

  def encrypt(
    message,
    key = rand(99999).to_s.rjust(5,'0'),
    date = Date.today.strftime("%d%m%y")
  )
    encrypt = Encrypt.new(message.downcase, key, date)
    {
      encryption: encrypt.encode_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = Date.today.strftime("%d%m%y"))
    decrypt = Decrypt.new(message.downcase, key, date)
    {
      decryption: decrypt.decode_message,
      key: key,
      date: date
    }
  end

end
