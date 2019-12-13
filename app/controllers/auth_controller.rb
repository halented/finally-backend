class AuthController < ApplicationController
    def create
        user = User.find_by({email: params[:auth][:email]})
        if user
            # if the user exists, return json for the user i suppose? and something about the auth session.
        else
            # create the user, then return json....of mayb just the auth session. and i think actually we have to do some password salting stuff here and provide the token.
        end
    end
end