module Api
  class DashboardController < ApplicationController
    before_action :authorize_jwt

    def index
      @kejadian = Kejadian.where(:status => "Verified")
      render :json => @kejadian.to_json(:include => [:kerusakans])
    end

    def show
      @kejadian = Kejadian.find(params[:id])
      render :json => @kejadian.to_json(:include => [:kerusakans])
    end
    
  end
end