class IntrovertsController < ApplicationController
    def index
        introverts = Introvert.all
        render json: introverts
    end
    
    def create
        # byebug
        current_user
        introv = Introvert.create(introvert_params)
        friendship = Friendship.create(user: current_user, introvert: introv)
        render json: {friendship: friendship, introvert: introv}
    end

    private

    def introvert_params
        params.require(:introvert).permit(:name, :activity, :img_ref, :on_cooldown)
    end
end
