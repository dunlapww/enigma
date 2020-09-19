class Enigma
  attr_reader :message, :key, :date

  def initialize(details)
    @message = details[:message]
    @key = details[:key]
    @date = details[:date]
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
