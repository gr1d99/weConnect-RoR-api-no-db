require 'categories'
require 'id_generator'

class Category
  include CategoryValidators

  attr_reader :id
  attr_accessor :name

  def initialize
    @id = generate_id
  end
end
