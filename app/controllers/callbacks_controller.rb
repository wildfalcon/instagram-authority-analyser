class CallbacksController < Devise::OmniauthCallbacksController
  def instagram
    identity = Identity.find_for_oauth(env["omniauth.auth"])
    current_user.identity = identity
    current_user.save
    redirect_to :home_index
  end
end
