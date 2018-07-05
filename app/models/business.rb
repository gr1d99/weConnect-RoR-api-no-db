class Business
  attr_reader :created_at, :updated_at
  attr_accessor :name, :category_id, :location_id
  def initialize(
    name:, category_id:, location_id:
  )
    @name = name
    @category_id = category_id
    @location_id = location_id
    @created_at = DateTime.now.strftime("%Y-%m-%d %H:%M")
    @updated_at = DateTime.now.strftime("%Y-%m-%d %H:%M")
  end
end