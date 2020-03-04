class PurposesController < ApplicationController

    def index
        purposes = Purpose.all
        render json: purposes
    end
end
