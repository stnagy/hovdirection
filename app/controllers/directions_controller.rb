class DirectionsController < ApplicationController
    
    def current
        direction = Direction.current
        render json: direction
    end

end