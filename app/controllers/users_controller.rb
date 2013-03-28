class UsersController < ApplicationController
  def show
    if current_user.nil?
      redirect_to root_path
    end

    @user = current_user
    respond_to do |format|
      if @user
        @babies = @user.babies
        format.json
      else
        format.json { render json: {}, status: :not_found }
      end
    end
  end
end
