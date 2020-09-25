require 'date'
require './lib/encrypt'
require './lib/decrypt'
require './lib/crack'

class Enigma

  def encrypt(
    message,
    key = rand(99999).to_s.rjust(5,'0'),
    date = Date.today.strftime("%d%m%y")
  )
    encrypt = Encrypt.new(message.downcase, key, date)
    {
      encryption: encrypt.translate_message(encrypt.encode_shift),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = Date.today.strftime("%d%m%y"))
    decrypt = Decrypt.new(message.downcase, key, date)
    {
      decryption: decrypt.translate_message(decrypt.decode_shift),
      key: key,
      date: date
    }
  end

  def crack(message, date = Date.today.strftime("%d%m%y"))
    crack = Crack.new(message.downcase, date)
    crack.cracked.size == 1 ? crk_key = crack.cracked[0] : crk_key = crack.cracked
    decrypt = Decrypt.new(message.downcase, crack.cracked[0], date)
    {
      decryption: decrypt.translate_message(decrypt.decode_shift),
      key: crk_key,
      date: date
    }
  end



end
