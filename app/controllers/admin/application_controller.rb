module Admin

  class ApplicationController < ::ApplicationController

    before_action :only_admin

    layout 'applicationAdmin'

    private

    def only_admin
      if !user_signed_in? && !$admin_mails.include?(current_user.email)
        redirect_to root_path, danger: "Vous n'avez pas les droits d'administration du site..."
      end
    end

  end

end