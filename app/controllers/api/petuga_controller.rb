module Api
  class PetugaController < ApplicationController
    before_action :authorize_jwt
    before_action :find_petuga, only: [:show, :update, :destroy]

    def index
      @petuga = Petuga.all
      render json: {
        values: @petuga,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @petuga,
        message: "Success",
      }, status: 200
    end

    def new
      @petuga = Petuga.new
    end

    def create
      @petuga = Petuga.new(petuga_params)
      if @petuga.save
        render json: {
          values: @petuga,
          message: "Success Create Petugas",
        }, status: 201
      else
        render error: { error: 'Uneable to create Petugas.'}, status: 400
      end
    end

    def edit
      @petuga = Petuga.where(id: params[:id]).first
    end

    def update
      if @petuga
        @petuga.update(petuga_params)
        render json: { message: 'Petugas succsessfully updated,'}, status: 200
      else 
        render error: { error: 'Uneable to update Petugas.'}, status: 400
      end
    end

    def destroy
      if @petuga
        @petuga.destroy
        render json: { message: 'Petugas succsessfully deleted,'}, status: 200
      else 
        render error: { error: 'Uneable to delete Petugas.'}, status: 400
      end
    end

    private 
    def petuga_params
      params.permit(:telp, :nama, :tempat_lahir, :tanggal_lahir, :alamat, :bagian, :status)
    end

    def find_petuga
      @petuga = Petuga.find(params[:id])
    end
  end
end