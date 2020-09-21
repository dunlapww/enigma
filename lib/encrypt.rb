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
    shifts = @shift.shifts
    counter = -1
    message_to_nums.map do |num|
      counter += 1
      total_shift = num + shifts[counter % shifts.size]
      final_shift = total_shift % @alphabet.size
    end
  end


end
