class Locations
  attr_reader :locations

  def initialize
    @locations = []
  end

  def add(location)
    @locations.push(location)
  end
end
