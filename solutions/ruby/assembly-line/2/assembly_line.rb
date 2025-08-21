class AssemblyLine

  private

  attr_writer :speed, :success_rate

  PRODUCTION_INCREMENT = 221
    SUCCESS_RATES = {
      0 => 0.0,
      1 => 1.0,  
      2 => 1.0,
      3 => 1.0,
      4 => 1.0,  
      5 => 0.9,  
      6 => 0.9,
      7 => 0.9,
      8 => 0.9,
      9 => 0.8,  
      10 => 0.77  
  }
  def initialize(speed)
    self.speed = speed
    self.success_rate = SUCCESS_RATES[speed]
  end

  public

  attr_reader :speed, :success_rate

  def production_rate_per_hour
    PRODUCTION_INCREMENT * speed * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end

end
