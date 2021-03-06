module Api
  class KejadianController < ApplicationController
    before_action :authorize_jwt
    before_action :find_kejadian, only: [:show, :update, :destroy]

    def index
      @kejadian = Kejadian.all
      render json: {
        values: @kejadian,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @kejadian,
        message: "Success",
      }, status: 200
    end

    def new
      @kejadian = Kejadian.new
    end

    def create
      @kejadian = Kejadian.new(kejadian_params)
      if @kejadian.save
        render json: {
          values: @kejadian,
          message: "Success Create Kejadian",
        }, status: 201
      else
        render json: { error: 'Uneable to create Kejadian.'}, status: 400
      end
    end

    def edit
      @kejadian = Kejadian.where(id: params[:id]).first
    end

    def update
      if @kejadian
        @kejadian.update(kejadian_params)
        render json: { message: 'Laporan Kejadian succsessfully updated,'}, status: 200
      else 
        render json: { error: 'Uneable to update Laporan Kejadian.'}, status: 400
      end
    end

    def destroy
      if @kejadian
        @kejadian.destroy
        render json: { message: 'Laporan Kejadian succsessfully deleted,'}, status: 200
      else 
        render json: { error: 'Uneable to delete Laporan Kejadian.'}, status: 400
      end
    end

    private 
    def kejadian_params
      params.permit(:tanggal, :kejadian, :deskripsi_kejadian, :lokasi, :status, :pelapor_id)
    end

    def find_kejadian
      @kejadian = Kejadian.find(params[:id])
    end
  end
end