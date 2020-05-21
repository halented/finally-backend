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
            # later on look into this: refactor how this info is being sent to use created_at.month, day, year. this way we don't have to save all the months in the frontend
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
        # below is the format we need to send back for the victoryline
        # data =  [
        #     {x: 1, y: 4}, 
        #     {x: 2, y: 7},
        #     {x: 3, y: 6}
        # ]
        data = crunchChartData(params["year"])
        
        render json: {data: data}
    end

    def crunchChartData(year)
        user = User.find_by(id: params[:id])
        data = [
            {'x'=>1, 'y'=> 0}, 
            {'x'=> 2, 'y'=> 0},
            {'x'=> 3, 'y'=> 0},
            {'x'=> 4, 'y'=> 0},
            {'x'=> 5, 'y'=> 0},
            {'x'=> 6, 'y'=> 0},
            {'x'=> 7, 'y'=> 0},
            {'x'=> 8, 'y'=> 0},
            {'x'=> 9, 'y'=> 0},
            {'x'=> 10, 'y'=> 0},
            {'x'=> 11, 'y'=> 0},
            {'x'=> 12, 'y'=> 0}
        ]
        # grab all hangouts from this user
        allHangouts = user.friendships.map{|ship|ship.hangouts}.flatten!

        # if there are any, start iterating
        if allHangouts.length > 0
            allHangouts.each do |hang|
                # make sure the hangout is in the specified year
                if hang.created_at.year.to_i === year.to_i
                    #grab month
                    mo = hang.created_at.month
                    # find month inside the data object, and increase the hangout count by one for that month
                    data.each do |obj|
                        if obj['x'].to_i == mo.to_i
                            obj['y'] += 1
                        end
                    end
                end
            end
        else
            return "No data from specified year"
        end
        
        return data
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
end
