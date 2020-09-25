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

  def clean_message_length
    clean_message.length
  end

  def end_letters
    clean_message.chars.pop(4)
  end

  def end_letter_positions
    end_letters.map do |letter|
      @alphabet.alpha_to_num[letter]
    end
  end

  def rotation
    -1 * ((clean_message_length - offsets.size) % offsets.size)
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
    4.times do |key|
      key_options = (0..4).map do |num|
        number = (end_encoded_pos[key] - offsets[key] - end_decoded_pos[key]) + (@alphabet.size * num)
        number.to_s.rjust(2,"0")
      end.select do |num|
        num.to_i > 0 && num.length <= 2
      end
      keys << key_options
    end
    keys
  end

  def cracked
    cracked = []
    all_key_options[0].each do |a_key|
      a_num = a_key[-1]
      all_key_options[1].each do |b_key|
        ab_num = b_key[0]
        if a_num == ab_num
          b_num = b_key[-1]
          all_key_options[2].each do |c_key|
            bc_num = c_key[0]
            if b_num == bc_num
              c_num = c_key[-1]
              all_key_options[3].each do |d_key|
                cd_num = d_key[0]
                if c_num == cd_num
                  cracked << a_key + c_key + d_key[-1]
                end
              end
            end
          end
        end
      end
    end
    cracked
  end

end
