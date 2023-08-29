class CustomSessionsController < ApplicationController
    def destroy
      # Implement your sign-out logic here, such as clearing session data.
      sign_out(current_user) if user_signed_in?
      redirect_to destroy_user_session_path, notice: 'You have been signed out.'
    end
  end
  