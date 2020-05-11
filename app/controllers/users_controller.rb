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
        # byebug

        # check if we have a user by email or username
        if !!@user && @user.valid?
            hangs = find_and_format_hangouts(@user)
            puts "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
            puts hangs
            puts "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
            render json: { user: @user, introverts: @user.introverts, purposes: Purpose.all, hangouts: hangs}, status: 200
        else
            render json: { error: 'no user found'}, status: :not_acceptable
        end
        # refactor to use current_user
        # why isn't current_user working
    end

    def find_and_format_hangouts(user)
        hangs = []
        user.friendships.each do |ship|
            # byebug
            # make the data readable for the front end
            ship.hangouts.each do |hang|
                hangs.push({hang.purpose.title=> hang.friendship.introvert.name})
                # byebug
            end
            # byebug
            # hangs.push({ship.hangouts => ship.introvert})
        end
        return hangs.flatten
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end
