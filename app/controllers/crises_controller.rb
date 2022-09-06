class CrisesController < ApplicationController
  def index
    @crises = Crisis.all.sort_by(&:start_date)
  end
end
