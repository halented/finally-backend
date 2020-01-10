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
        puts @user
        puts "From leatherbacks to loggerheads, six of the seven species of sea turtles are threatened or endangered at the hand of humans. Sadly, the fact is that they face many dangers as they travel the seas — including accidental capture and entanglement in fishing gear (also known as bycatch), the loss of nesting and feeding sites to coastal development, poaching, and ocean pollution including plastic.

        These creatures are well-adapted to the ocean though they require air to survive. Their size varies greatly, depending upon species — from the small Kemp’s ridley, which weighs between 80–100 pounds, to the enormous leatherback, which can weigh more than 1,000 pounds.
        
        HABITAT & DIET
        Sea turtles live in almost every ocean basin throughout the world, nesting on tropical and subtropical beaches. They migrate long distances to feed, often crossing entire oceans. Some loggerheads nest in Japan and migrate to Baja California Sur, Mexico to forage before returning home again. Leatherbacks are capable of withstanding the coldest water temperatures (often below 40˚F) and are found as far south as Chile and as far north as Alaska."

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
