module Api
    module Auth
        class AuthenticationController < ApplicationController
            before_action :authorize_jwt, except: :login
        
            def login
                @user = User.find_by(username: params[:username])
                if @user&.authenticate(params[:password])
                    token = JsonWebToken.encode(user_id: @user.id)
                    render json: { status: 'success', message: 'login success', data: { token: token } }, status: :ok
                else
                    render json: { status: 'fail', message: 'username or password is wrong' }, status: :unauthorized
                end
            end
        end
        
    end
end