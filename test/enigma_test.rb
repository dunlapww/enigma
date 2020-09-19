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
    assert_equal [2, 29, 93, 38], enigma.keys
  end

  def test_it_can_take_a_default_of_todays_date
    enigma = Enigma.new({message: "hello end",key: "02938"})
    Date.stubs(:today).returns(Date.new(2020,9,19))
    assert_equal "190920", enigma.date
  end

  def test_it_can_take_a_default_random_key
    skip
    enigma = Enigma.new({message: "hello end"})
    enigma.stubs(:rand).returns(1234)
    assert_equal "01234", enigma.key
  end

  def test_it_can_return_square_of_date_as_string
    enigma = Enigma.new({message: "hello end",key: "02938", date: "040895"})
    assert_equal "1672401025", enigma.square_date
  end

  def test_it_can_convert_squared_date_to_array_of_ints
    enigma = Enigma.new({message: "hello end",key: "02938", date: "040895"})
    enigma.stubs(:square_date).returns("102035423")
    assert_equal [1,0,2,0,3,5,4,2,3], enigma.squared_date_nums
  end

  def test_it_can_create_offsets
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    enigma.stubs(:square_date).returns("102035423")
    assert_equal [5, 4, 2, 3], enigma.offsets
  end

  def test_it_can_create_raw_shifts
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    enigma.stubs(:offsets).returns([5,4,2,3])
    enigma.stubs(:keys).returns([2,26,15,47])
    assert_equal [7,30,17,50], enigma.raw_shifts
  end

  def test_it_can_create_final_shifts
    enigma = Enigma.new({message: "hello end",key: "02938",date: "040895"})
    enigma.stubs(:offsets).returns([5,4,2,3])
    enigma.stubs(:keys).returns([2,26,15,47])
    assert_equal [7,3,17,23], enigma.final_shifts
  end


  def test_it_can_create_an_alpha_list
    expected = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z  )
    assert_equal expected, enigma.alpha_list
  end






end
