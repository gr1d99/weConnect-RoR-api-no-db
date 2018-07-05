require 'id_generator'

class Category

  attr_reader :id
  attr_accessor :name

  def initialize(name:)
    @id = generate_id
    @name = name
  end
end
