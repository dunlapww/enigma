class Enigma
  attr_reader :message, :key, :date

  def initialize(details)
    @message = details[:message]
    @key = details.fetch(:key, rand(99999).to_s.rjust(5,'0'))
    @date = details.fetch(:date, Date.today.strftime("%d%m%y"))
  end

  def square_date
    (@date.to_i * @date.to_i).to_s
  end

  def squared_date_nums
    square_date.chars.map do |string_int|
      string_int.to_i
    end
  end

  def offsets(num_of_keys = @key.length - 1)
    squared_date_nums.pop(num_of_keys)
  end

  def keys
    @key.chars.each_with_index.reduce([]) do |collector, (char, index)|
      if @key.chars[index + 1]
        collector << (char + @key.chars[index + 1]).to_i
      end
      collector
    end
  end

  def raw_shifts
    offsets.each_with_index.reduce([]) do |collector, (offset, index)|
      collector << offset + keys[index]
    end
  end

  def final_shifts
    raw_shifts.map do |shift|
      shift % num_to_alpha.size
    end
  end

  def num_to_alpha
    (0..26).zip(("a".."z").to_a << " ").to_h
  end

  def alpha_to_num
    num_to_alpha.invert
  end


  def message_to_nums
  end

  def encode
  end













end
