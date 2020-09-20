require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_exists
    key = Key.new("01234")
    offset = Offset.new("040895")
    shift = Shift.new(key, offset)

    assert_instance_of Shift, shift
  end
end
