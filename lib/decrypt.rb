require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/alphabet'
require './lib/cryptable'

class Decrypt
  include Cryptable
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @shift = Shift.new(Key.new(@key), Offset.new(@date))
    @alphabet = Alphabet.new
  end

  def decode_shift
    @shift.shifts.map {|num| -1 * num}
  end

end
