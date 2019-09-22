module PermissionHelper

def isAdmin?
  user_signed_in? && $admin_mails.include?(current_user.email)
end


end