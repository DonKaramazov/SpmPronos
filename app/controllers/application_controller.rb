class ApplicationController < ActionController::Base

    before_action :only_signed_in
    add_flash_types :success,:success_toast,:danger
    # add_flash_types :success,:danger
    helper_method :current_user, :user_signed_in?


    private

    def only_signed_in
        if !user_signed_in?
            redirect_to new_user_path,danger:"Vous n'avez pas le droit d'accéder à cette page"
        end    
    end

    def only_signed_out
        if user_signed_in?
            puts "redirection vers le profil"
            redirect_to home_index_path
        end

        #redirect_to profil_path if user_signed_in?
    end

    def user_signed_in?
        !current_user.nil?
    end

      # Retourne l'utilisateur actuellement connecté
    def current_user
        return nil if !session[:auth] || !session[:auth]['id']
        return @_user if @_user #lazy loading
        @_user = User.find_by_id(session[:auth]['id']) #find_by renvoie nil si il ne trouve pas
    end
end
