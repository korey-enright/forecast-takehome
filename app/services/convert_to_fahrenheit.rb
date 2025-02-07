class ConvertToFahrenheit
  def initialize(temp)
    @temp = temp
  end

  def execute
    (1.8 * (@temp - 273.15) + 32).round(1)
  end
end
