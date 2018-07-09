require 'id_generator'

class Category
  attr_reader :id, :has_errors
  attr_accessor :name, :errors

  def initialize(name:)
    @id = generate_id
    @name = name
    @errors = []
    @has_errors = false

    add_error if name.nil?
  end

  def self.create(name)
    new(name: name)
  end


  private

  def add_error
    @errors.push("Name can't be blank")
    @has_errors = true
  end
end
