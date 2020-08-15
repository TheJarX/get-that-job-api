class UserSessionsController < ApplicationController
    before_action :require_user_login, except: :create
    
    def create
        @user = User.find_by(email: params[:email])

        if @user&.valid_password?(params[:password])
            render :create, status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
        current_user&.authentication_token = nil
        current_user.save
        head(:ok)
    end
end
