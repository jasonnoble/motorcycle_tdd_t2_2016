# It's a harley yo!
class Motorcycle
  attr_reader :fuel, :miles, :speed, :speed_limit
  # def fuel
  #   @fuel
  # end
  def initialize
    @fuel = 0
    @miles = 0
    @speed = 0
    @speed_limit = 0
  end

  def filler_up
    @fuel = 100
  end

  def drive(speed, speed_limit)
    @fuel -= 10
    warn "We're on vapor Cougar!" if fuel <= 30
    puts "FUEL: #{fuel}"
    @speed = speed
    @speed_limit = speed_limit
  end

  def stop
    @speed = 0
  end
end
