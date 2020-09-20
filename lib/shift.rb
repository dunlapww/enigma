class Shift
  attr_reader :keys, :offsets

  def initialize(key, offset)
    @keys = key.keys
    @offsets = offset.squared_date_nums
  end


end
