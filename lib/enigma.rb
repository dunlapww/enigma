class Enigma
  attr_reader :message, :key, :date, :shift

  def initialize(details)
    @message = details[:message]
    @key = details.fetch(:key, rand(99999).to_s.rjust(5,'0'))
    @date = details.fetch(:date, Date.today.strftime("%d%m%y"))
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
  #
  # def encode_shift
  #   counter = -1
  #   message_to_nums.map do |num|
  #     counter += 1
  #     (num + final_shifts[counter % final_shifts.size]) % alpha_to_num.size
  #   end
  # end
  #
  # def encode_message
  #   encode_shift.reduce("") do |memo, num|
  #     memo << num_to_alpha[num]
  #   end
  # end
  #
  # def encrypt
  #   {
  #     encryption: encode_message,
  #     key: @key,
  #     date: @date
  #   }
  # end
  #
  # def decode_shift
  # end



end
