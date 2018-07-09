class Categories
  attr_reader :categories

  def initialize(categories = [])
    @categories = categories
  end

  def count
    @categories.count
  end

  def add(category)
    append(category)
  end

  private

  def append(category)
    @categories.push(category)
  end
end
