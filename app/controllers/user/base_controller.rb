class User::BaseController < ApplicationController
  before_action :require_user

  private

   def require_user
     render file: "/public/404" unless current_user
   end
   
end

