module Api
  class LogistikController < ApplicationController
    before_action :authorize_jwt
    before_action :find_logistik, only: [:show, :update, :destroy]

    def index
      @logistik = Logistik.all
      render json: {
        values: @logistik,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @logistik,
        message: "Success",
      }, status: 200
    end

    def new
      @logistik = Logistik.new
    end

    def create
      @logistik = Logistik.new(logistik_params)
      if @logistik.save
        render json: {
          values: @logistik,
          message: "Success Create Logistik",
        }, status: 201
      else
        render error: { error: 'Uneable to create Logistik.'}, status: 400
      end
    end

    def edit
      @logistik = Logistik.where(id: params[:id]).first
    end

    def update
      if @logistik
        @logistik.update(logistik_params)
        render json: { message: 'Logistik succsessfully updated,'}, status: 200
      else 
        render error: { error: 'Uneable to update Logistik.'}, status: 400
      end
    end

    def destroy
      if @logistik
        @logistik.destroy
        render json: { message: 'Logistik succsessfully deleted,'}, status: 200
      else 
        render error: { error: 'Uneable to delete Logistik.'}, status: 400
      end
    end

    private 
    def logistik_params
      params.permit(:jenis_bantuan, :nama_barang, :jumlah, :tanggal_distribusi, :penerima_id, :petuga_id, :kejadian_id)
    end

    def find_logistik
      @logistik = Logistik.find(params[:id])
    end
  end
end