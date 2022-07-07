module Api
    module Auth
        class AuthenticationController < ApplicationController
            before_action :authorize_jwt, except: [:login, :register]

            def register
                @user = User.create(user_params)

                if @user.save
                    render json: { status: 'success', message: 'create account successful' }, status: :created
                else
                    render json: { status: 'fail', message: @user.errors.full_message }, status: :unprocessable_entity
                end
            end
        
            def login
                @user = User.find_by(username: params[:username])
                if @user&.authenticate(params[:password])
                    token = JsonWebToken.encode(user_id: @user.id)
                    render json: { status: 'success', message: 'login success', data: { token: token } }, status: :ok
                else
                    render json: { status: 'fail', message: 'username or password is wrong' }, status: :unauthorized
                end
            end

            private

            def user_params
                params.permit(:nama, :username, :password)
            end
        end
        
    end
end