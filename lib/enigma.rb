require './lib/encrypt'

class Enigma

  def encrypt(message, key, date)
    encrypt = Encrypt.new(message, key, date)
    {
      encryption: encrypt.encode_message,
      key: key,
      date: date
    }
  end

end
