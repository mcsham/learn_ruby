class Temperature
  attr_reader :in_fahrenheit, :in_celsius

  def initialize(f: nil, c: nil)
    self.in_fahrenheit = f if f
    self.in_celsius = c if c
  end

  private

  def in_fahrenheit=(fahrenheit)
    @in_fahrenheit = fahrenheit
    @in_celsius = (fahrenheit - 32) * 5 / 9.0
  end

  def in_celsius=(celsius)
    @in_celsius = celsius
    @in_fahrenheit = celsius * 9 / 5.0 + 32
  end

  def self.from_celsius(celsius)
    Temperature.new c: celsius
  end

  def self.from_fahrenheit(fahrenheit)
    Temperature.new f: fahrenheit
  end
end

class Celsius < Temperature
  def initialize(param)
    self.in_celsius = param if param
  end
end

class Fahrenheit < Temperature
  def initialize(param)
    self.in_fahrenheit = param if param
  end
end
