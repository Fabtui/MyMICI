class CrisesController < ApplicationController
  def index
    @crises = Crisis.all.sort_by(&:start_date)
    @suspicious_ingredients = Crisis.suspicious_ingredients
    @suspicious_elements = Crisis.suspicious_elements
  end
end
