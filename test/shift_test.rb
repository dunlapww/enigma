require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_exists
    key = Key.new("01234")
    offset = Offset.new("040895")
    shift = Shift.new(key, offset)

    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    key = Key.new("01234")
    offset = Offset.new("040895")
    shift = Shift.new(key, offset)

    assert_equal [2, 29, 93, 38], shift.keys
    assert_equal [1,0,2,0,3,5,4,2,3], shift.offsets
  end

end
