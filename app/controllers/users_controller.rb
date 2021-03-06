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
            ship.hangouts.each do |hang|

                hangs.push({
                    "hang_id" => hang.id, 
                    "introvert" => [hang.friendship.introvert.name, hang.friendship.introvert.id], 
                    "date" => [hang.created_at.month, hang.created_at.day, hang.created_at.year], 
                    "title" => hang.purpose.title
                })
                
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
        if data.length > 0
            render json: {data: data}
        else
            render json: {error: "No data from specified year"}
        end
        
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

        # need a way to track whether or not the data has been touched
        altered = false
        
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
                            altered = true
                        end
                    end
                end
            end
        else
            data = []
        end
        
        return altered ? data : []
    end

    def update
        puts "!!@000002394576892138037456290756290751907491823478123984719827349172weuirhfaksjdfhcvkjzbshdfkjghs"
        user = User.find_by(id: params[:id])
         if user.update(user_params)
            render json: { user: UserSerializer.new(user)}, status: :accepted
         else
            render json: { error: 'failed to save changes'}, status: :not_acceptable
         end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email, :name)
    end
end
