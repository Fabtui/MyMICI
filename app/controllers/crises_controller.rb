class CrisesController < ApplicationController
  def index
    @crises = Crisis.all
  end
end
