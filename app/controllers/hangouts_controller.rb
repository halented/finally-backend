class HangoutsController < ApplicationController

    def index
        hangouts = Hangout.all
        render json: hangouts
    end

    def create
        # find user, check if introvert is on cooldown
        usr = current_user
        int = usr.introverts.find_by({name: params[:introvert]})
        if int.on_cooldown 
            render json: {error: "You can't hangout with that introvert right now! Try back when their cooldown is over."}
        else
            ship = usr.friendships.find_by({introvert_id: int.id})
            purpose = Purpose.all.find_by({title: params[:purpose]})
            # set the introvert on cooldown
            int.on_cooldown = true
            int.save
            hang = Hangout.new({friendship_id: ship.id, purpose_id: purpose.id, location: 'unknown', duration:60})
            # also need to add a location and duration from frontend info -- but that's details
            if hang.save
                render json: {message: "Hangout Saved!"}
            else
                render json: {error: "Internal error: please try again!"}
            end
        end
    end
    
end
