module Api
  module V1
    class PositionsController < ApplicationController
      respond_to :json

      # POST /positions
      def create
        @user = User.find(params[:user_id])
        
        # Create a new position if one doesn't exist, or update existing position
        if @user.position.nil?
          puts "position nil"
          @user.position = Position.new(params[:position])
        else
          puts "position exists"
          @user.position.update_attributes(params[:position])
        end

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
