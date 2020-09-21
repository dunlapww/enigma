require './lib/encrypt'
require './lib/decrypt'

class Enigma

  def encrypt(message, key, date)
    encrypt = Encrypt.new(message, key, date)
    {
      encryption: encrypt.encode_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date)
    decrypt = Decrypt.new(message, key, date)
    {
      decryption: decrypt.decode_message,
      key: key,
      date: date
    }
  end

end
