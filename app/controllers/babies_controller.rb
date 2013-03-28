class BabiesController < ApplicationController
  def index
    @babies = User.find(params[:user_id]).babies

    respond_to do |format|
      format.json { render json: @babies, status: :ok }
    end
  end

  # GET /:username
  #
  def show
    @baby = Baby.find_by(username: params[:username])

    respond_to do |format|
      format.json { render json: @baby, status: :ok }
    end
  end

  # POST
  #
  def create
    puts current_user
    @baby = current_user.babies.build(params)

    respond_to do |format|
      if @baby.save
        format.json { render json: @baby, status: :ok }
      else
        format.json { render json: @baby.errors, status: :unprocessable_entity}
      end
    end
  end
end
