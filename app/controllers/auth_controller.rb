class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        userEm = User.find_by({email: params[:auth][:email]})
        userNa = User.find_by({username: params[:auth][:username]})
        #authenticate comes from bcrypt
        if userEm && userNa && userNa.id === userEm.id && userNa.authenticate(params[:auth][:password]) != false
            # check if username, email and password are right
            render json: { user: UserSerializer.new(userEm), token: encode_token(userEm.id)}, status: :created
        elsif userEm || userNa
            render json: {error: 'Username or email is incorrect'}
        else 
            user = User.create(username: params[:auth][:username], password: params[:auth][:password], email: params[:auth][:email])
            if user.valid?
                render json: { user: UserSerializer.new(user), token: encode_token(user.id)}, status: :created
            else
                render json: { error: 'Failed to create user'}, status: :not_acceptable
            end
        end
    end

    def show
        # used to verify that the user is who they say they are and are allowed to view things
    end
end