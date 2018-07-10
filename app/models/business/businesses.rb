class Businesses
  def initialize(businesses: [])
    @businesses = businesses
  end

  def count
    @businesses.length
  end

  def add(business)
    append(business)
  end

  private

  def append(business)
    @businesses.push(business)
  end
end
