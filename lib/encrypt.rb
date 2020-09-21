require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/alphabet'
require './lib/cryptable'


class Encrypt
  include Cryptable
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @shift = Shift.new(Key.new(@key), Offset.new(@date))
    @alphabet = Alphabet.new
  end

  def encode_shift
    @shift.shifts
  end

end
