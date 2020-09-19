require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    assert_instance_of Enigma, enigma
  end

  def test_it_has_attributes
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    assert_equal "hello end", enigma.message
    assert_equal "02938", enigma.key
    assert_equal "040895", enigma.date
  end

  def test_it_can_create_keys
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    assert_equal [2, 29, 93, 38], enigma.create_keys
  end

  def test_it_can_take_a_default_of_todays_date
    enigma = Enigma.new({message: "hello end",key: "02938"})
    assert_equal "190920", enigma.get_date({message: "hello end",key: "02938"})
  end

  def test_it_can_convert_date_to_number_and_square
    enigma = Enigma.new({message: "hello end",key: "02938", date: "040895"})
    assert_equal 1672401025, enigma.square_date
  end

  def test_it_can_convert_squared_date_to_array_of_ints
    enigma = Enigma.new({message: "hello end",key: "02938", date: "040895"})
    enigma.stubs(:square_date).returns("102035423")
    assert_equal [1,0,2,0,3,5,4,2,3], enigma.int_array
  end

  def test_it_can_create_offsets
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    assert_equal [1, 0, 2, 5], enigma.create_offsets
  end





end
