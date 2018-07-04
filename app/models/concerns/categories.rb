module CategoryValidators
  extend ActiveSupport::Concern

  def valid?
    if @name
      true
    else
      false
    end
  end
end
