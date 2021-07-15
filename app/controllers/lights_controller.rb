class LightsController < ApplicationController
  def index
    @lights = current_user.passive_lights
    @lights.where(checked: false).each do |light|
      light.update_attributes(checked: true)
    end
  end

  
end
