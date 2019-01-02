###############################################################################
# Define the Car class

class MyCar

###############################################################################
# Define read only (attr_reader), write only (attr_write), and
#  read/write (attr_accessor) variables

  attr_reader :speed, :year, :model, :color

###############################################################################
# This method is called when an object is created using new(). Since the
#  variables don't have setters (see above) we need to directly access the
#  instance variables. Since model and color are both strings, object creation
#  uses required keyword arguments.

  def initialize(model: '', year: 1999, color: 'primer')
    @model = model
    @year = year
    @color = color
    @speed = 0
  end

###############################################################################
# Change the speed through this method. The accel() and brake() methods process
#  their inputs to generate a delta velocity, then call this method is actually
#  change the speed. Any validation of the speed is performed in this method.

# If the speed is less than zero, then raise a RangeError. Speed cannot be
#  faster than speed of light. Use instance variable since there is no setter
#  for speed

  private def change_speed(delta_vel)
    $C = 3e6
    raise(RangeError, 'Final speed must be >= 0') unless (@speed+delta_vel) >= 0
    raise(RangeError, 'Final speed must be <= c') unless (@speed+delta_vel) <= $C
    @speed += delta_vel
  end

###############################################################################
# Allow the car to press the accelerator. The accelerator command is positive,
# to accommodate changing the input to a position. If the accelerator command
# is < 0 then raise a RangeError.

# noinspection RubyUnnecessaryReturnStatement
  def accel(delta_vel=0)
    raise(RangeError, 'DeltaV must be >= 0') unless delta_vel >= 0
    change_speed(delta_vel)
    return(self)
  end

###############################################################################
# Allow the car to press the brake. The brake command is positive, to
#  accommodate changing the input to a position. If the brake command is < 0
#  raise a RangeError

# noinspection RubyUnnecessaryReturnStatement
  def brake(delta_vel=0)
    raise(RangeError, 'DeltaV must be >= 0') unless delta_vel >= 0
    change_speed(-delta_vel)
    return(self)
  end

###############################################################################
# Allow the car to turn off. To turn off the car set the speed to 0.

# noinspection RubyUnnecessaryReturnStatement
  def turn_off
    change_speed(-speed)
    return(self)
  end

###############################################################################
# Repaint the car and return car to owner. Use the instance variable since the
#  color does not have a setter

# noinspection RubyUnnecessaryReturnStatement
  def repaint(new_color='primer')
    @color = new_color
    # noinspection RubyUnnecessaryReturnStatement
    return(self)
  end

end