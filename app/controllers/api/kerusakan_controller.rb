module Api
  class KerusakanController < ApplicationController
    before_action :authorize_jwt
    before_action :find_kerusakan, only: [:show, :update, :destroy]

    def index
      @kerusakan = Kerusakan.all
      render json: {
        values: @kerusakan,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @kerusakan,
        message: "Success",
      }, status: 200
    end

    def new
      @kerusakan = Kerusakan.new
    end

    def create
      @kerusakan = Kerusakan.new(kerusakan_params)
      if @kerusakan.save
        render json: {
          values: @kerusakan,
          message: "Success Create Laporan Kerusakan",
        }, status: 201
      else
        render error: { error: 'Uneable to create Laporan Kerusakan.'}, status: 400
      end
    end

    def edit
      @kerusakan = Kerusakan.where(id: params[:id]).first
    end

    def update
      if @kerusakan
        @kerusakan.update(kerusakan_params)
        render json: { message: 'Laporan Kerusakan succsessfully updated,'}, status: 200
      else 
        render error: { error: 'Uneable to update Laporan Kerusakan.'}, status: 400
      end
    end

    def destroy
      if @kerusakan
        @kerusakan.destroy
        render json: { message: 'Laporan Kerusakan succsessfully deleted,'}, status: 200
      else 
        render error: { error: 'Uneable to delete Laporan Kerusakan.'}, status: 400
      end
    end

    private 
    def kerusakan_params
      params.permit(:kerusakan, :kerugian, :keterangan, :kejadian_id)
    end

    def find_kerusakan
      @kerusakan = Kerusakan.find(params[:id])
    end
  end
end