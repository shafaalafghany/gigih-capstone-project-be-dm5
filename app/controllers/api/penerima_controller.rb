module Api
  class PenerimaController < ApplicationController
    before_action :find_penerima, only: [:show, :update, :destroy]

    def index
      @penerima = Penerima.all
      render json: {
        values: @penerima,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @penerima,
        message: "Success",
      }, status: 200
    end

    def new
      @penerima = Penerima.new
    end

    def create
      @penerima = Penerima.new(penerima_params)
      if @penerima.save
        render json: {
          values: @penerima,
          message: "Success Create Penerima",
        }, status: 201
      else
        render error: { error: 'Uneable to create Penerima.'}, status: 400
      end
    end

    def edit
      @penerima = Penerima.where(id: params[:id]).first
    end

    def update
      if @penerima
        @penerima.update(penerima_params)
        render json: { message: 'Penerima succsessfully updated,'}, status: 200
      else 
        render error: { error: 'Uneable to update Penerima.'}, status: 400
      end
    end

    def destroy
      if @penerima
        @penerima.destroy
        render json: { message: 'Penerima succsessfully deleted,'}, status: 200
      else 
        render error: { error: 'Uneable to delete Penerima.'}, status: 400
      end
    end

    private 
    def penerima_params
      params.permit(:tanggal, :nama, :tempat_lahir, :tanggal_lahir, :jk, :telp, :pelapor_id)
    end

    def find_penerima
      @penerima = Penerima.find(params[:id])
    end
  end
end