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

  def rotation
    -1 * ((clean_message.length - offsets.size) % offsets.size)
  end

  def end_encoded_pos
    end_letter_positions.rotate(rotation)
  end


  def end_decoded_pos
    " end".split("").map do |char|
      @alphabet.alpha_to_num[char]
    end.rotate(rotation)
  end

  def all_key_options
    keys = []
    " end".length.times do |key|
      key_options = (0..4).map do |num|
        (end_encoded_pos[key] - offsets[key] - end_decoded_pos[key]) + (@alphabet.size * num)
      end.select do |num|
        num.to_s.length <= 2
      end
      keys << key_options
    end
    keys
  end

  def cracks
    

  end





  def decoded_message
  end


end
