class HangoutsController < ApplicationController

    def index
        hangouts = Hangout.all
        render json: hangouts
    end

    def create
        usr = current_user
        int = usr.introverts.find_by({name: params[:introvert]})
        ship = usr.friendships.find_by({introvert_id: int.id})
        purpose = Purpose.all.find_by({title: params[:purpose]})
        # puts params
        # find the friendship
        # something like user.friendships.select
        # byebug
        hang = Hangout.new({friendship_id: ship.id, purpose_id: purpose.id, location: 'unknown', duration:60})
        # also need to add a location and duration i guess
        if hang.save
            render json: {message: "Hangout Saved!"}
        else
            render json: {error: "Internal error: please try again!"}
        end
    end
    
end
