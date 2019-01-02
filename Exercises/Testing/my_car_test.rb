# Include the required modules

require_relative "../my_car"
require "test/unit"

class MyCarTest < Test::Unit::TestCase

###############################################################################
#  Define constants used to create test object

  TEST_CAR_YEAR = 1999
  TEST_CAR_MODEL = 'Tesla'
  TEST_CAR_COLOR = 'blue'
  INIT_SPEED = 100

###############################################################################
#  Define object to be tested

  def setup
    @test_car = MyCar.new(model:TEST_CAR_MODEL,
                          year:TEST_CAR_YEAR,
                          color:TEST_CAR_COLOR)
  end

###############################################################################
# Test newly created cars have speed=0. Also test that MyCar.new is private

  def test_create_my_cars
    assert_equal(@test_car.speed, 0, 'Speed of new car should be 0')
    assert_equal(MyCar.new.model, '')
    assert_equal(MyCar.new.year, 1999)
    assert_equal(MyCar.new.color, 'primer')
    assert_equal(MyCar.new(model:TEST_CAR_MODEL).model, TEST_CAR_MODEL)
    assert_equal(MyCar.new(year:TEST_CAR_YEAR).year, TEST_CAR_YEAR)
    assert_equal(MyCar.new(color:TEST_CAR_COLOR).color, TEST_CAR_COLOR)
  end

###############################################################################
# Test that the car can accelerate. Throws an exception if the accel<=0

  def test_accel
    assert_equal(@test_car.accel(20).speed, 20)
    assert_equal(@test_car.accel(10).speed, 20+10)
    assert_equal(@test_car.accel(0).speed, 20+10+0)
    assert_raise(RangeError) {@test_car.accel(-1)}
  end
###############################################################################
# Test that the car can brake. Throws an exception if the accel<=0 or final
#  speed <= 0

  def test_brake
    @test_car.accel(INIT_SPEED)
    assert_equal(@test_car.brake(20).speed, INIT_SPEED-20)
    assert_equal(@test_car.brake(10).speed, INIT_SPEED-20-10)
    assert_equal(@test_car.brake(0).speed, INIT_SPEED-20-10)
    assert_raise(RangeError){@test_car.brake(INIT_SPEED)}
    assert_raise(RangeError) {@test_car.brake(-1)}
  end
###############################################################################
# Test that we can repaint the car.

  def test_color
    assert_equal(@test_car.color, TEST_CAR_COLOR)
    assert_equal(@test_car.repaint.color, 'primer')
    assert_equal(@test_car.repaint('qwerty').color, 'qwerty')
  end
###############################################################################
# Test that we can look at the model of the car, but cannot change it.

  def test_model
    assert_raise(ArgumentError){@test_car.model('Civic')}
  end
###############################################################################
# Test that we can look at the year of the car, but cannot change it.

  def test_year
    assert_raise(ArgumentError){@test_car.year(2020)}
  end

end