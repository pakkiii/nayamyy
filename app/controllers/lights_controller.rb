class LightsController < ApplicationController

  before_action :authenticate_user!, only: :index

  def index
    @lights = current_user.passive_lights
    @lights.where(checked: false).each do |light|
      light.update_attributes(checked: true)
    end
  end
end
