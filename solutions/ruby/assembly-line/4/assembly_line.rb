class AssemblyLine

  private

  attr_writer :speed, :success_rate

  PRODUCTION_INCREMENT = 221
  SUCCESS_RATES = {
    (..0)  => 0.0,
    (1..4) => 1.0,
    (5..8) => 0.9,
    (9..9) => 0.8,
    (10..10) => 0.77
  }.freeze
  
  def initialize(speed)
    self.speed = speed
    self.success_rate = SUCCESS_RATES.find { |range, _| range.include?(speed)}.last
    if self.success_rate.nil?
      raise ArgumentError, "This speed is not supported: #{speed}"
    end
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
