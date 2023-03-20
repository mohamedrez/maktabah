# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_omniauth auth

    if user.persisted?
      flash[:notice] = t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t "devise.omniauth_callbacks.failure", kind: "Google", reason: user.errors.full_messages.join("--")
      redirect_to new_user_session_path
    end
  end

  def twitter
    user = User.from_omniauth auth

    if user.persisted?
      flash[:notice] = t "devise.omniauth_callbacks.success", kind: "Twitter"
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t "devise.omniauth_callbacks.failure", kind: "Twitter", reason: user.errors.full_messages.join("--")
      redirect_to new_user_session_path
    end
  end

  def auth
    request.env["omniauth.auth"]
  end
end
