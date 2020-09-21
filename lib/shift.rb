class Shift
  attr_reader :keys, :offsets

  def initialize(key, offset)
    @keys = key.keys
    @offsets = offset.squared_date_nums
  end

  def key_offsets
    offsets.pop(keys.size)
  end

  def shifts
    key_offsets.each_with_index.reduce([]) do |collector, (offset, index)|
      collector << offset + @keys[index]
    end
  end



end
