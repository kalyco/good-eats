require_relative 'restaurants_controller'

class HomesController < ApplicationController
  def index
    redirect_to restaurants_path
  end
end
