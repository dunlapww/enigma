require './test/test_helper'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new("01234")
    assert_instance_of Key, key
  end

end
