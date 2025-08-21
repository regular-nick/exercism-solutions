class AssemblyLine

  private

  attr_writer :speed, :success_rate

  PRODUCTION_INCREMENT = 221

  def initialize(speed)
    self.speed = speed
    self.success_rate = success_rate_from!(speed)
  end

  def success_rate_from!(speed)
    case speed
    when 0 then 0.0
    when 1..4 then 1.0
    when 5..8 then 0.9
    when 9 then 0.8
    when 10 then 0.77
    end
  end

  public

  attr_reader :speed, :success_rate

  def production_rate_per_hour
    self.class::PRODUCTION_INCREMENT * speed * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end

end
