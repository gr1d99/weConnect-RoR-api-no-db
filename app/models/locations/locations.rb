class Locations
  attr_reader :locations

  def initialize
    @locations = []
  end

  def add(location)
    @locations.push(location)
  end

  def find(id)
    locations.each do |location|
      return location if location.id == id
    end
    []
  end
end
