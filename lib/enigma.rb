class Enigma
  attr_reader :message, :key, :date

  def initialize(details)
    @message = details[:message]
    @key = details[:key]
    @date = get_date(details)
  end

  def get_date(details)
    if details[:date].nil?
      @date = Date.today.strftime("%d%m%y")
    else
      @date = details[:date]
    end
  end

  def square_date
    (@date.to_i * @date.to_i).to_s
  end

  def int_array
    square_date.chars.map do |string_int|
      string_int.to_i
    end
  end

  def create_offsets(num_of_keys = @key.length - 1)
    int_array.pop(num_of_keys)
  end

  def create_keys
    @key.chars.each_with_index.reduce([]) do |collector, (char, index)|
      if @key.chars[index + 1]
        collector << (char + @key.chars[index + 1]).to_i
      end
      collector
    end
  end


end
