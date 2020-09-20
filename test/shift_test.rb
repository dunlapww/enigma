require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_exists
    key = Key.new("01234")
    offset = Offset.new("040895")
    shift = Shift.new(key, offset)

    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    key = Key.new("02938")
    offset = Offset.new("040895")
    shift = Shift.new(key, offset)

    assert_equal [2, 29, 93, 38], shift.keys
    assert_equal [1, 6, 7, 2, 4, 0, 1, 0, 2, 5], shift.offsets
  end

  def test_it_can_check_valid_keys
    key = Key.new("02938")
    offset = Offset.new("040895")
    shift = Shift.new(key, offset)
    assert shift.valid_keys?
  end

  def test_it_can_create_key_offsets
    key = Key.new("02938")
    offset = Offset.new("040895")
    shift = Shift.new(key, offset)
    assert_equal [1, 0, 2, 5], shift.key_offsets
  end


  def test_it_can_create_raw_shifts
    key = Key.new("02938")
    offset = Offset.new("040895")
    shift = Shift.new(key, offset)
    shift.stubs(:key_offsets).returns([5,4,2,3])
    shift.stubs(:keys).returns([2,29,93,38])
    assert_equal [7,33,95,41], shift.raw_shifts
  end

end
