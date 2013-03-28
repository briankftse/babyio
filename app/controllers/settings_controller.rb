class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def account
    @user = current_user
  end

  def password
    if request.post?
      @user = current_user

      updated = false
      if @user.valid_password? params[:current_password]
        password = params[:password]
        password_confirmation = params[:password_confirmation]
        if !password.blank? and password == password_confirmation
          if @user.update_attributes(password: password)
            flash[:notice] = "Password updated successfully."
            sign_in(@user, :bypass => true)
            updated = true
          end
        end

        flash[:error] = "Passwords do not match." unless updated
      else
        flash[:error] = "Invalid password."
      end

      redirect_to settings_password_url
    end
  end

  def apps
  end
end
