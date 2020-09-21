module Cryptable

  def message_to_nums
    @message.chars.map do |char|
      if @alphabet.letters.include?(char)
        @alphabet.alpha_to_num[char]
      else
        char
      end
    end
  end

  def apply_shift(shifts)
    counter = -1
    message_to_nums.map do |num|
      if num.class == String
        num
      else
        counter += 1
        total_shift = num + shifts[counter % shifts.size]
        total_shift % @alphabet.size
      end
    end
  end

  def translate_message(shifts)
    apply_shift(shifts).reduce("") do |memo, num|
      if num.class == String
        memo << num
      else
        memo << @alphabet.num_to_alpha[num]
      end
    end
  end
end
