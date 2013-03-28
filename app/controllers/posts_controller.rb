class PostsController < ApplicationController
  # GET /:username
  #
  def index
    baby = Baby.find_by(username: params[:username])
    @posts = baby.posts

    respond_to do |format|
      format.json { render json: @posts, status: :ok }
    end
  end

  # GET /:username/posts/:id
  #
  def show
    baby = Baby.find_by(username: params[:username])
    @post = baby.posts.where(id: params[:id])

    respond_to do |format|
      format.json { render json: @post, status: :ok }
    end
  end

  # PUT /:username/posts/:id
  #
  def update
    baby = Baby.find_by(username: params[:username])
    @post = baby.posts.where(id: params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.json { render json: @post, status: :ok }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  # POST /:username/posts
  #
  def create
    baby = Baby.find_by(username: params[:username])
    @post = baby.posts.build(params)

    respond_to do |format|
      if @post.save
        format.json { render json: @post, status: :ok }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /:username/posts/:id
  #
  def destroy
    baby = Baby.find_by(username: params[:username])
    @post = baby.posts.find_by(id: params[:id])
    @post.destroy

    respond_to do |format|
      format.json { render json: @post, status: :ok }
    end
  end
end
