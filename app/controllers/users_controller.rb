class UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: { user: UserSerializer.new(@user)}, status: :created
        else
            render json: { error: 'failed to create user'}, status: :not_acceptable
        end
    end

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find_by(id: params[:id])

        # check if we have a user by email or username
        if !!@user && @user.valid?
            render json: { user: @user, introverts: @user.introverts}, status: 200
        else
            render json: { error: 'no user found'}, status: :not_acceptable
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end
