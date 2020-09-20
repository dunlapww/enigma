require './test/test_helper'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new("040895")
    assert_instance_of Offset, offset
  end
end
