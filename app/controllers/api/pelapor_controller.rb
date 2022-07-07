class Api::PelaporController < ApplicationController
  before_action :find_pelapor, only: [:show, :update, :destroy]

  def index
    @pelapor = Pelapor.all
    render json: {
      values: @pelapor,
      message: "Success",
    }, status: 200
  end

  def show
    render json: @pelapor
  end

  def new
    @pelapor = Pelapor.new
  end

  def create
    @pelapor = Pelapor.new(pelapor_params)
    if @pelapor.save
      render json: @pelapor
    else
      render error: { error: 'Uneable to create Pelapor.'}, status: 400
    end
  end

  def edit
    @pelapor = Pelapor.where(id: params[:id]).first
  end

  def update
    if @pelapor
      @pelapor.update(pelapor_params)
      render json: { message: 'Pelapor succsessfully updated,'}, status: 200
    else 
      render error: { error: 'Uneable to update Pelapor.'}, status: 400
    end
  end

  def destroy
    if @pelapor
      @pelapor.destroy
      render json: { message: 'Pelapor succsessfully updated,'}, status: 200
    else 
      render error: { error: 'Uneable to delete Pelapor.'}, status: 400
    end
  end

  private 
  def pelapor_params
    params.required(:pelapor).permit(:nama, :nik, :telp, :tempat_lahir, :tanggal_lahir, :tanggal, :user_id)
  end

  def find_pelapor
    @pelapor = Pelapor.find(params[:id])
  end
end
