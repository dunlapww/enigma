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


  def test_it_can_decode_message
    crack = Crack.new("vjqtbeaweqihssi","291018")
    assert_equal "hello world end", crack.decoded_message
  end

  def test_it_can_calc_offsets
    crack = Crack.new("vjqtbeaweqihssi","291018")
    assert_equal [6, 3, 2, 4], crack.offsets
  end

  def test_it_can_clean_a_message
    crack = Crack.new("vjqtbeaweqi!hssi","291018")
    assert_equal "vjqtbeaweqihssi", crack.clean_message
  end

  def test_it_knows_offset_for__end
    crack = Crack.new("vjqtbeaweqi!hssi","291018")
    assert_equal [4, 6, 3, 2], crack.end_offsets
  end

  def test_it_calc_end_letter_positions
    crack = Crack.new("vjqtbeawe!qihssi","291018")
    assert_equal [7, 18, 18, 8], crack.end_letter_positions
  end

  def test_rotate_end_letters
    crack = Crack.new("vjqtbeawe!qihssi","291018")
    assert_equal [""], crack.rotate_end
  end



end
