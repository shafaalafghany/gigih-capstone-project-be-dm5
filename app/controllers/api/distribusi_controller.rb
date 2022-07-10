module Api
  class DistribusiController < ApplicationController
    before_action :authorize_jwt
    before_action :find_distribusi, only: [:show, :update, :destroy]

    def index
      @distribusi = Distribusi.all
      render json: {
        values: @distribusi,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @distribusi,
        message: "Success",
      }, status: 200
    end

    def new
      @distribusi = Distribusi.new
    end

    def create
      @distribusi = Distribusi.new(distribusi_params)
      if @distribusi.save
        render json: {
          values: @distribusi,
          message: "Success Create Distribusi",
        }, status: 201
      else
        render json: { error: 'Uneable to create Distribusi.'}, status: 400
      end
    end

    def edit
      @distribusi = Distribusi.where(id: params[:id]).first
    end

    def update
      if @distribusi
        @distribusi.update(distribusi_params)
        render json: { message: 'Laporan Distribusi succsessfully updated,'}, status: 200
      else 
        render json: { error: 'Uneable to update Laporan Distribusi.'}, status: 400
      end
    end

    def destroy
      if @distribusi
        @distribusi.destroy
        render json: { message: 'Laporan Distribusi succsessfully deleted,'}, status: 200
      else 
        render json: { error: 'Uneable to delete Laporan Distribusi.'}, status: 400
      end
    end

    private 
    def distribusi_params
      params.permit(:tanggal, :jumlah, :petuga_id, :logistik_id)
    end

    def find_distribusi
      @distribusi = Distribusi.find(params[:id])
    end
  end
end