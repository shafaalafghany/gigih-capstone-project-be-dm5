module Api
  class PoskoController < ApplicationController
    before_action :authorize_jwt
    before_action :find_posko, only: [:show, :update, :destroy]

    def index
      @posko = Posko.all
      render json: {
        values: @posko,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @posko,
        message: "Success",
      }, status: 200
    end

    def new
      @posko = Posko.new
    end

    def create
      @posko = Posko.new(posko_params)
      if @posko.save
        render json: {
          values: @posko,
          message: "Success Create Posko",
        }, status: 201
      else
        render json: { error: 'Uneable to create Posko.'}, status: 400
      end
    end

    def edit
      @posko = Posko.where(id: params[:id]).first
    end

    def update
      if @posko
        @posko.update(posko_params)
        render json: { message: 'Posko succsessfully updated,'}, status: 200
      else 
        render json: { error: 'Uneable to update Posko.'}, status: 400
      end
    end

    def destroy
      if @posko
        @posko.destroy
        render json: { message: 'Posko succsessfully deleted,'}, status: 200
      else 
        render json: { error: 'Uneable to delete Posko.'}, status: 400
      end
    end

    private 
    def posko_params
      params.permit(:nama, :lokasi, :kapasitas, :penanggung_jawab, :kejadian_id)
    end

    def find_posko
      @posko = Posko.find(params[:id])
    end
  end
end
