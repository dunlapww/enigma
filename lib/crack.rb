class Crack
  attr_reader :message, :date

  def initialize(message, date)
    @message = message
    @date = date
    @alphabet = Alphabet.new
  end

  def offsets
    offset = Offset.new(@date)
    offset.squared_date_nums.pop(4)
  end

  def clean_message
    @message.chars.reduce("") do |memo, char|
      if @alphabet.letters.include?(char)
        memo << char
      end
      memo
    end
  end

  def end_letter_positions
    clean_message.chars.pop(4).map do |letter|
      @alphabet.alpha_to_num[letter]
    end
  end

  def end_encoded_pos
    rotation = (clean_message.length - offsets.size) % offsets.size
    end_letter_positions.rotate(-1 * rotation)
  end

  def a_key_options
    (0..4).map do |num|
      (end_encoded_pos[0] - offsets[0] - 4) + (@alphabet.size * num)
    end.select do |num|
      num > 0 && num.to_s.length <= 2
    end
  end





  def decoded_message
  end

  def key
  end
end
