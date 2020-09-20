require './test/test_helper'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new("040895")
    assert_instance_of Offset, offset
  end

  def test_it_has_attributes
    offset = Offset.new("040895")
    assert_equal "040895", offset.string_date
  end

  def test_it_can_return_square_of_date_as_string
    offset = Offset.new("040895")
    assert_equal "1672401025", offset.square_date
  end
end
