class Microwave
  def initialize(time)
    # Error checking
    if time.to_s.length > 4 || time.to_s.length < 1
      raise RuntimeError, "Please enter 2 to 4 numbers"
    end
    # When button pressed more than 3 times, we go in minutes zone
    if time.to_s.length > 2
      @minutes, @seconds = time.to_s[0..-3].to_i, time.to_s[-2..-1].to_i
    else
      @minutes, @seconds = 0, time
    end
  end

  def timer
    extra_seconds_to_minutes, remaining_seconds = @seconds.divmod(60)
    @minutes = extra_seconds_to_minutes ? @minutes + extra_seconds_to_minutes : minutes
    @seconds = extra_seconds_to_minutes ? remaining_seconds : @seconds
    format("%02d:%02d", @minutes, @seconds)
  end
end

m = Microwave.new(59)
m.timer
