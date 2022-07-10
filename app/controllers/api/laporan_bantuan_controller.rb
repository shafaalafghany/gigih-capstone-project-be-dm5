module Api
  class LaporanBantuanController < ApplicationController
    before_action :authorize_jwt

    def index
      @laporan_bantuan = Logistik.all
      render :json => @laporan_bantuan(:include => [:distribusis])
    end

    def show
      @laporan_bantuan = Logistik.find(params[:id])
      render :json => @laporan_bantuan(:include => [:distribusis])
    end

    def new
      @laporan_bantuan = Logistik.new
      @laporan_bantuan.distribusis.build
    end

    def create
      @laporan_bantuan = Logistik.new(laporan_bantuan_params)
      if @laporan_bantuan.save
        render json: {
          values: @laporan_bantuan,
          message: "Success Create Laporan Bencana",
        }, status: 201
      else
        render error: { error: 'Uneable to create Laporan Bencana.'}, status: 400
      end
    end

    def update
      @laporan_bantuan = Logistik.find(params[:id])
      if @laporan_bantuan
        @laporan_bantuan.update(laporan_bantuan_params)
        render json: { message: 'Laporan Bencana succsessfully updated,'}, status: 200
      else
        render error: { error: 'Uneable to delete Laporan Bencana.'}, status: 400
      end
    end

    def destroy
      @laporan_bantuan = Logistik.find(params[:id])
      if @laporan_bantuan
        @laporan_bantuan.destroy
        render json: { message: 'Laporan Bencana succsessfully deleted,'}, status: 200
      else 
        render error: { error: 'Uneable to delete Laporan Bencana.'}, status: 400
      end
    end

    private
    def laporan_bantuan_params
      params.permit(:jenis_bantuan, :nama_barang, :jumlah, :tanggal_distribusi, :penerima_id, :petuga_id, :kejadian_id, 
        distribusis_attributes: [:tanggal, :jumlah, :petuga_id])
    end

  end
end