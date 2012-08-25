module Api
  module V1
    class PositionsController < ApplicationController
      
      respond_to :json

      # POST /positions
      def create
        @user = User.find(params[:user_id])
        
        # Create a new position in Juxtapose API
        position_resource = PositionResource.new(:user_id => @user.juxtapose_id,
                                                   :latitude => params[:position][:latitude],
                                                   :longitude => params[:position][:longitude],
                                                   :timestamp => params[:position][:timestamp])
        begin
          position_resource.save!
          
          # Store last position locally, postion_resource.save valdates params so local save should not fail
          @user.position.update_attributes(params[:position])
          @user.position.save
          
          render :json => position_resource, :except => [:id, :_id, :location], status: :ok

        # See ActiveResource documentation for specific exceptions that are raised
        # Invalid format, object failed attribute validation
        rescue ActiveResource::ResourceInvalid
          render :json => position_resource.errors, status: :unprocessable_entity

        # Any other generic server side failure message is trapped here
        rescue
          render :json => position_resource.errors, status: :internal_server_error
        end
      end
      
    end
  end
end
