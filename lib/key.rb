class Key
  attr_reader :string_num

  def initialize(string_num)
    @string_num = string_num
  end

  def keys
    @string_num.chars.each_with_index.reduce([]) do |collector, (char, index)|
      if @string_num.chars[index + 1]
        collector << (char + @string_num.chars[index + 1]).to_i
      end
      collector
    end
  end



end
