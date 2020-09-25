require './test/test_helper'

class CrackTest < Minitest::Test

  def test_it_exists
    crack = Crack.new("vjqtbeaweqihssi","291018")
    assert_instance_of Crack, crack
  end

  def test_it_has_attributes
    crack = Crack.new("vjqtbeaweqihssi","291018")
    assert_equal "vjqtbeaweqihssi", crack.message
    assert_equal "291018", crack.date
  end

  def test_it_can_calc_offsets
    crack = Crack.new("vjqtbeaweqihssi","291018")
    assert_equal [6, 3, 2, 4], crack.offsets
  end

  def test_it_can_clean_a_message
    crack = Crack.new("vjqtbeaweqi!hssi","291018")
    assert_equal "vjqtbeaweqihssi", crack.clean_message
  end

  def test_it_can_return_clean_message_length
    crack = Crack.new("vjqtbeaweqi!hssi","291018")
    assert_equal 15, crack.clean_message_length
  end

  def test_it_calc_end_letter_positions
    crack = Crack.new("vjqtbeawe!qihssi","291018")
    crack.stubs(:end_letters).returns(["a", "b", "c", "d"])
    crack.stubs(:clean_message_length).returns(8)
    assert_equal [0, 1, 2, 3], crack.end_letter_positions
  end

  def test_end_encoded_pos
    crack = Crack.new("keqtaomthnw", "40895")
    crack.stubs(:end_letters).returns(["a", "b", "c", "d"])
    crack.stubs(:clean_message_length).returns(8)
    assert_equal [0, 1, 2, 3], crack.end_encoded_pos
    crack.stubs(:clean_message_length).returns(9)
    assert_equal [3, 0, 1, 2], crack.end_encoded_pos
    crack.stubs(:clean_message_length).returns(10)
    assert_equal [2, 3, 0, 1], crack.end_encoded_pos
  end

  def test_end_decoded_pos
    crack = Crack.new("keqtaomthnw", "40895")
    assert_equal [4, 13, 3, 26], crack.end_decoded_pos
  end

  def test_end_letters
    crack = Crack.new("keqtaomthnw", "40895")
    crack.stubs(:clean_message).returns "sjkjkljabcd"
    assert_equal ["a", "b", "c", "d"], crack.end_letters
  end

  def test_all_key_options
    crack = Crack.new("qgxug!qtunpc", "300536")
    assert_equal [["02", "29", "56", "83"], ["27", "54", "81"], ["17", "44", "71", "98"], ["15", "42", "69", "96"]], crack.all_key_options
  end

  def test_rotation
    crack = Crack.new("keqtaomthnw", "40895")
    crack.stubs(:clean_message_length).returns(8)
    assert_equal 0, crack.rotation
    crack.stubs(:clean_message_length).returns(9)
    assert_equal -1, crack.rotation
  end

  def test_cracks
    crack = Crack.new("keqtaomthnw", "40895")
    assert_equal ["02715"], crack.cracked
    crack = Crack.new("qgxug!qtunpc", "300536")
    assert_equal ["02715"], crack.cracked
  end

end
