class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    
    def require_either_user_or_company_login
      (authenticate_company_token || authenticate_user_token) || render_unauthorized('Access denied')
    end

    def require_user_login
      authenticate_user_token || render_unauthorized('Access denied')
    end

    def require_company_login
      authenticate_company_token || render_unauthorized('Access denied')
    end
  
    def current_user
      @current_user ||= authenticate_user_token
    end

    def current_company
      @current_company ||= authenticate_company_token
    end
  
    private
  
    def render_unauthorized(message)
      errors = { errors: { message: message } }
      render json: errors, status: :unauthorized
    end
  
    def authenticate_user_token
      authenticate_with_http_token do |token, _options|
        User.find_by(authentication_token: token)
      end
    end

    def authenticate_company_token
      authenticate_with_http_token do |token, _options|
        Company.find_by(authentication_token: token)
      end
    end
end
