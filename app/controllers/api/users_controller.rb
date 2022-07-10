module Api
    class UsersController < ApplicationController
        before_action :authorize_jwt
        before_action :find_user

        def show
            render json: { status: "success", "message": "user found", "data": @user }, status: 200
        end

        def update
            if @user
                @user.update(user_params)
                render json: { status: "success", message: "user successfully updated" }, status: 200
            else
                render json: { status: "fail", message: "user not found" }, status: 404
            end
        end

        def destroy
            if @user
                @user.destroy
                render json: { status: "success", message: "user successfully deleted" }, status: 200
            else
                render json: { status: "fail", message: "user not found" }, status: 404
            end
        end

        private

        def user_params
            params.permit(:nama, :username, :password, :telp)
        end

        def find_user
            @user = User.find(params[:id])
        end
    end
end
