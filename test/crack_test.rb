require './test/test_helper'

class CrackTest < Minitest::Test

  def test_it_exists
    crack = Crack.new()
    assert_instance_of Crack, crack
  end
end
