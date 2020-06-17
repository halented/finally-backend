class PurposesController < ApplicationController

    def index
        purposes = Purpose.all
        render json: purposes
    end

    def create
        newPurpose = Purpose.new(purpose_params)

        if newPurpose.save
            render json: {purpose: newPurpose}
        else
            render json: {error: newPurpose.errros.full_messages}, status: :not_acceptable
        end
    end

    private
    def purpose_params
        params.require(:purpose).permit(:title, :equipment, :intensity)
    end
end
