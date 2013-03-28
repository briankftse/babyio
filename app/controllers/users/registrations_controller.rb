class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
    @no_header = true
  end

  def create
    super
    # TODO track user creation
    # TODO send welcome email
  end

  def edit
    redirect_to settings_account_url
  end

  def update
    respond_to do |format|
      if current_user.update_attributes(params[:user])
        format.html {
          flash[:notice] = "Account successfully updated."
          redirect_to settings_account_url
        }
        format.json { render json: @user, status: :ok }
      else
        format.html {
          flash[:error] = "Account update unsuccessful. Please try again later."
          render :action => :edit
        }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
