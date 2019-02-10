class SessionsController < ApplicationController
  skip_before_action :only_signed_in, only: [:new, :create] 
  
  def new
  end

  def create
    user_params = params.require(:user)
   
    # on accepte le login et l'email comme identifiant
    @user = User.where('confirmed = 1 AND (username = :username OR email = :username)',username: user_params[:username]).first
    if @user and @user.authenticate(user_params[:password])
      session[:auth] = @user.to_session
      redirect_to home_index_path, success_toast: 'Connexion réussie'
    else
      redirect_to new_session_path, danger: 'Identifiants incorrects'
    end
  end

  def destroy
    session.destroy
    redirect_to new_session_path, success_toast: 'Vous êtes maintenant déconnecté'
  end
end
