module Validator
  extend ActiveSupport::Concern

  def validate(name, value)
    validate_blank(name, value)
  end

  def add_error(attribute, error)
    key = attribute.to_sym

    if @errors[key]
      @errors[key].push(error)
    else
      @errors[key] = [].push(error)
    end

    @has_errors = true
  end

  def validate_blank(name, value)
    return unless value.blank?
    error = "#{name} can't be blank"
    add_error(name, error)
  end
end