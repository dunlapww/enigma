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

  def end_offsets
    rotation = (@message.length - offsets.size) % offsets.size
    offsets.rotate(rotation)
  end

  def end_letter_positions
    @message.pop(4).map do |letter|
    end
  end


  def decoded_message
  end

  def key
  end
end
