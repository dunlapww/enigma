class Crack
  attr_reader :offsets

  def initialize(message, date)
    @message = message
    @date = date
    @offsets = set_offsets(date)
  end

  def set_offsets(date)
    offset = Offset.new(date)
    offset.squared_date_nums.pop(4)
  end

  

  def decoded_message
  end

  def key
  end
end
