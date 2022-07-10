module Api
  class LaporanBencanaController < ApplicationController

    def index
      @pelapor = Pelapor.all
      render :json => @pelapor.to_json(:include => [:kejadians => {:include => [:kerusakans]}])
    end

    def show
      @pelapor = Pelapor.find(params[:id])
      render :json => @pelapor.to_json(:include => [:kejadians => {:include => [:kerusakans]}])
    end

    def new
      @laporan_bencana = Pelapor.new
      @laporan_bencana.kejadians.build.kerusakans.build
    end

    def create
      @laporan_bencana = Pelapor.new(laporan_bencana_params)
      if @laporan_bencana.save
        render json: {
          values: @laporan_bencana,
          message: "Success Create Laporan Bencana",
        }, status: 201
      else
        render error: { error: 'Uneable to create Laporan Bencana.'}, status: 400
      end
    end

    def update
      @laporan_bencana = Pelapor.find(params[:id])
      if @laporan_bencana
        @laporan_bencana.update(laporan_bencana_params)
        render json: { message: 'Laporan Bencana succsessfully updated,'}, status: 200
      else
        render error: { error: 'Uneable to delete Laporan Bencana.'}, status: 400
      end
    end

    def destroy
      @laporan_bencana = Pelapor.find(params[:id])
      if @laporan_bencana
        @laporan_bencana.destroy
        render json: { message: 'Laporan Bencana succsessfully deleted,'}, status: 200
      else 
        render error: { error: 'Uneable to delete Laporan Bencana.'}, status: 400
      end
    end

    private 
    def pelapor_params
      params.permit(:nama, :nik, :telp, :tempat_lahir, :tanggal_lahir, :tanggal, :user_id)
    end

    def kejadian_params
      params.permit(:tanggal, :kejadian, :deskripsi_kejadian, :lokasi, :pelapor_id)
    end

    def kerusakan_params
      params.permit(:kerusakan, :kerugian, :keterangan, :kejadian_id)
    end

    def laporan_bencana_params
      params.permit(:nama, :nik, :telp, :tempat_lahir, :tanggal_lahir, :tanggal, :user_id, 
        kejadians_attributes: [:tanggal, :kejadian, :deskripsi_kejadian, :lokasi, 
          kerusakans_attributes: [:kerusakan, :kerugian, :keterangan]])
    end

  end
end