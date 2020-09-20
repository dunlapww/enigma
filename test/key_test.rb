require './test/test_helper'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new("01234")
    assert_instance_of Key, key
  end

  def test_it_has_attributes
    key = Key.new("01234")
    assert_equal "01234", key.string_num
  end

end
