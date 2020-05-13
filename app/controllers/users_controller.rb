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
            hangs = find_and_format_hangouts(@user)
            check_cooldown(@user.introverts)
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
            # make the data readable for the front end -- return the purpose of the hangout, the friend, and the date
            # later on look into this: created_at.strftime("%Y-%m-%d") -- it will return something like "2020-01-10" to the frontend instead. will probably make that cleaner
            ship.hangouts.each do |hang|

                hangs.push({hang.purpose.title=> [hang.friendship.introvert.name, hang.created_at, hang.id]})
            end
        end
        return hangs
    end

    def check_cooldown(ints)
        ints.each do |int|
            if int.on_cooldown
                # each introvert's cooldown is 240 hours. if the current time minus the last time it was updated (the last time you hung out) is greater than or equal to 240 hours (seen here in seconds), then reset the cooldown & commit the change. 864000
                time = Time.now
                if time - int.updated_at >= 864000
                    int.on_cooldown = false
                    int.save
                end
            end
        end
    end

    def chart
        # puts "HIT THE ROUTE CHART CHART ROUTE HIT THE ROUTE CHART CHART ROUTE HIT THE ROUTE CHART CHART ROUTE HIT THE ROUTE CHART CHART ROUTE HIT THE ROUTE CHART CHART ROUTE HIT THE ROUTE CHART CHART ROUTE HIT THE ROUTE CHART CHART ROUTE"
        # byebug
        data =  [
            {x: 1, y: 4}, 
            {x: 2, y: 7},
            {x: 3, y: 6}
        ]
        render json: {data: data}
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end
