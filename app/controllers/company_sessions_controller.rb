class CompanySessionsController < ApplicationController
    before_action :require_company_login, only: :destroy
    
    def create
        @company = Company.find_by(email: params[:email])

        if @company&.valid_password?(params[:password])
            render :create, status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
        current_company&.authentication_token = nil
        current_company.save
        head(:ok)
    end
end
