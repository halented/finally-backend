class IntrovertsController < ApplicationController
    def index
        introverts = Introvert.all
        render json: introverts
    end
    
    def create
        current_user
        introv = Introvert.create(introvert_params)
        friendship = Friendship.create(user: current_user, introvert: introv)
        render json: {friendship: friendship, introvert: introv}
    end

    def show
        introv = set_introv
        friendship = Friendship.find_by(user: current_user)
        introv.users.select{|user| user === current_user}
        render json: {user: current_user, introvert: introv}
    end

    def update
        introv = Introvert.find(params[:id])
        introv.update(introvert_params)
        if introv.save
            render json: {introvert: introv}
        else
            render json: {error: "Something went wrong"}
        end
    end

    private

    def introvert_params
        params.require(:introvert).permit(:name, :activity, :img_ref, :on_cooldown)
    end

    def set_introv
        @introvert = Introvert.find(params[:id])
    end
end
