class Encrypt
  attr_reader :message, :key, :date

  def initialize(
    message,
    key = rand(99999).to_s.rjust(5,'0'),
    date = Date.today.strftime("%d%m%y")
  )
    @message = message
    @key = key
    @date = date
    @shift = Shift.new(Key.new(@key), Offset.new(@date))
    @alphabet = Alphabet.new
  end

  def final_shifts
    @shift.shifts.map do |shift|
      shift % @alphabet.size
    end
  end

  def message_to_nums
    @message.chars.map do |char|
      @alphabet.alpha_to_num[char]
    end
  end

  def encode_shift
    counter = -1
    message_to_nums.map do |num|
      counter += 1
      require "pry"; binding.pry
      final
      (num + final_shifts[counter % final_shifts.size]) % @alphabet.size
    end
  end
end
