class AuthController < ApplicationController
    def create
        @user = User.find_by({email: params[:auth][:email]})
        if @user && @user.authenticate(params[:auth][:password]) === true
            # if the user exists, return the jwt token and or whatever you want idfk
            # inside of this create method you can decide how to handle whether or not the email axists and if you want to check for the username
            # JWT.encode({user_id: })
        else
            @user = User.create(user_params)
            if @user.valid?
                render json: { user: UserSerializer.new(@user)}, status: :created
            else
                render json: { error: 'failed to create user'}, status: :not_acceptable
            end
            # create the user, then return json....of mayb just the auth session. and i think actually we have to do some password salting stuff here and provide the token.
        end
    end

    def show
        # used to verify that the user is who they say they are and are allowed to view things
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
    # maybe if the params give you trouble just do this manually above instead of strong params
end