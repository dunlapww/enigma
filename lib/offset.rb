class Offset
  attr_reader :string_date

  def initialize(string_date)
    @string_date = string_date
  end

  def square_date
    (@string_date.to_i * @string_date.to_i).to_s
  end

end
