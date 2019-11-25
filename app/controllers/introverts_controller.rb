class IntrovertsController < ApplicationController
    def index
        introverts = Introvert.all
        render json: introverts
    end
end
