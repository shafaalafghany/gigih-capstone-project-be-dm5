class ApplicationController < ActionController::API
    def authorize_jwt
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:id])
        rescue ActiveRecord::NotFound => e
            render json: { status: fail, message: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { status: fail, message: e.message }, status: :unauthorized
        end
    end
end
