require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/alphabet'

class Decrypt
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @shift = Shift.new(Key.new(@key), Offset.new(@date))
    @alphabet = Alphabet.new
  end

  def message_to_nums
    @message.chars.map do |char|
      @alphabet.alpha_to_num[char]
    end
  end

  def decode_shift
    shifts = @shift.shifts.map {|num| -1 * num}
    counter = -1
    message_to_nums.map do |num|
      counter += 1
      total_shift = num + shifts[counter % shifts.size]
      final_shift = total_shift % @alphabet.size
    end
  end

  def decode_message
    decode_shift.reduce("") do |memo, num|
      memo << @alphabet.num_to_alpha[num]
    end
  end

end
