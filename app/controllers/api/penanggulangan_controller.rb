module Api
  class PenanggulanganController < ApplicationController
    before_action :authorize_jwt
    before_action :find_penaggulangan, only: [:show, :update, :destroy]

    def index
      @penanggulangan = Penanggulangan.all
      render json: {
        values: @penanggulangan,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @penanggulangan,
        message: "Success",
      }, status: 200
    end

    def new
      @penanggulangan = Penanggulangan.new
    end

    def create
      @penanggulangan = Penanggulangan.new(penanggulangan_params)
      if @penanggulangan.save
        render json: {
          values: @penanggulangan,
          message: "Success Create Laporan Penanggulangan",
        }, status: 201
      else
        render json: { error: 'Uneable to create Laporan Penanggulangan.'}, status: 400
      end
    end

    def edit
      @penanggulangan = Penanggulangan.where(id: params[:id]).first
    end

    def update
      if @penanggulangan
        @penanggulangan.update(penanggulangan_params)
        render json: { message: 'Laporan Penanggulangan succsessfully updated,'}, status: 200
      else 
        render json: { error: 'Uneable to update Laporan Penanggulangan.'}, status: 400
      end
    end

    def destroy
      if @penanggulangan
        @penanggulangan.destroy
        render json: { message: 'Laporan Penanggulangan succsessfully deleted,'}, status: 200
      else 
        render json: { error: 'Uneable to delete Laporan Penanggulangan.'}, status: 400
      end
    end

    private 
    def penanggulangan_params
      params.permit(:tanggal, :penanggulangan, :lokasi, :petuga_id, :kejadian_id)
    end

    def find_penanggulangan
      @penanggulangan = Penanggulangan.find(params[:id])
    end
  end
end