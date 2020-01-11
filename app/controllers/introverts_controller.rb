class IntrovertsController < ApplicationController
    def index
        introverts = Introvert.all
        render json: introverts
    end
    
    def create
        byebug
        introv = Introvert.create(introvert_params)
        puts "helo??!"
    end

    private

    def introvert_params
        params.require(:introvert).permit(:name, :activity, :img_ref, :on_cooldown)
    end
end
