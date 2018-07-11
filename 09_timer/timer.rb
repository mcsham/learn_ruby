class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0.0
  end

  def time_string
    hour = @seconds / 3600
    minutes = (@seconds % 3600) / 60
    seconds = @seconds % 3600 % 60
    '%02d:%02d:%02d' % [hour, minutes, seconds]
  end

end