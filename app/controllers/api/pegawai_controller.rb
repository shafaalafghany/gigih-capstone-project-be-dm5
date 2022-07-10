module Api
  class PegawaiController < ApplicationController
    before_action :authorize_jwt
    before_action :find_pegawai, only: [:show, :update, :destroy]

    def index
      @pegawai = Pegawai.all
      render json: {
        values: @pegawai,
        message: "Success",
      }, status: 200
    end

    def show
      render json: {
        values: @pegawai,
        message: "Success",
      }, status: 200
    end

    def new
      @pegawai = Pegawai.new
    end

    def create
      @pegawai = Pegawai.new(pegawai_params)
      if @pegawai.save
        render json: {
          values: @pegawai,
          message: "Success Create Pegawai",
        }, status: 201
      else
        render json: { error: 'Uneable to create Pegawai.'}, status: 400
      end
    end

    def edit
      @pegawai = Pegawai.where(id: params[:id]).first
    end

    def update
      if @pegawai
        @pegawai.update(pegawai_params)
        render json: { message: 'Pegawai succsessfully updated,'}, status: 200
      else 
        render json: { error: 'Uneable to update Pegawai.'}, status: 400
      end
    end

    def destroy
      if @pegawai
        @pegawai.destroy
        render json: { message: 'Pegawai succsessfully deleted,'}, status: 200
      else 
        render json: { error: 'Uneable to delete Pegawai.'}, status: 400
      end
    end

    private 
    def pegawai_params
      params.permit(:nik, :nama, :tempat_lahir, :tanggal_lahir, :jk, :alamat, :telp, :jabatan, :status, :user_id)
    end

    def find_pegawai
      @pegawai = Pegawai.find(params[:id])
    end
  end
end