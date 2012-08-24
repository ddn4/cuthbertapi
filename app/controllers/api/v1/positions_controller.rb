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
                                                   :timestamp => @user.position.timestamp,
                                                )
        begin
          position_resource.save
          render :json => position_resource, :except => [:id, :_id, :location], status: :ok

        # Treat any exception as a server error at this point
        # Can expand to handle individual exceptions if needed
        # See ActiveResource documentation for specific exceptions that are raised
        rescue
          render :json => @user.position.errors, status: :internal_server_error
        end

        # Store last position locally, ignore errors with local save
        @user.position.save
      end
      
    end
  end
end
