module Api
  module V1
    class PositionsController < ApplicationController
      respond_to :json

      # POST /positions
      def create
        @user = User.find(params[:user_id])
        
        # Create a new position if one doesn't exist, or update existing position
        if @user.position.nil?
          @user.position = Position.new(params[:position])
        else
          @user.position.update_attributes(params[:position])
        end

        # Create a new position in Juxtapose API
        position_resource = PositionResource.new(:user_id => @user.juxtapose_id,
                                                  :latitude => @user.position.latitude,
                                                  :longitude => @user.position.longitude,
                                                  :timestamp => @user.position.timestamp)
        position_resource.save

        # Store last position locally
        if @user.position.save
          render :json => @user.position
          # render :json @position, status: :created, location: @position
        else
          render :json => @user.position.errors, status: :unprocessable_entity
        end
      end
      
    end
  end
end
