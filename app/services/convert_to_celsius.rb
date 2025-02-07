class ConvertToCelsius
  def initialize(temp)
    @temp = temp
  end

  def execute
    (@temp - 273.15).round(1)
  end
end
