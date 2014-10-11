class QrcodesController < ApplicationController
  before_action :set_qrcode, only: [:show, :edit, :update, :destroy]

  # GET /qrcodes
  # GET /qrcodes.json
  def index
    @qrcodes = Qrcode.all
  end

  # GET /qrcodes/1
  # GET /qrcodes/1.json
  def show
    @qr = RQRCode::QRCode.new( @qrcode.text_to_encode, size: @qrcode.size, level: @qrcode.level[0].downcase.to_sym )
    @qr_png = @qr.to_img.resize(400, 400).to_data_url

  end

  # GET /qrcodes/new
  def new
    @qrcode = Qrcode.new

  end

  # GET /qrcodes/1/edit
  def edit
  end

  # POST /qrcodes
  # POST /qrcodes.json
  def create
    @qrcode = Qrcode.new(qrcode_params)
    @qrcode.level = params[:level]
    respond_to do |format|
      if @qrcode.save
        format.html { redirect_to @qrcode, notice: 'Qrcode was successfully created.' }
        format.json { render :show, status: :created, location: @qrcode }
      else
        format.html { render :new }
        format.json { render json: @qrcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qrcodes/1
  # PATCH/PUT /qrcodes/1.json
  def update
    respond_to do |format|
      if @qrcode.update(qrcode_params)
        @qrcode.level = params[:level]
        @qrcode.save
        format.html { redirect_to @qrcode, notice: 'Qrcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @qrcode }
      else
        format.html { render :edit }
        format.json { render json: @qrcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qrcodes/1
  # DELETE /qrcodes/1.json
  def destroy
    @qrcode.destroy
    respond_to do |format|
      format.html { redirect_to qrcodes_url, notice: 'Qrcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qrcode
      @qrcode = Qrcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qrcode_params
      params.require(:qrcode).permit(:text_to_encode, :size, :level)
    end
end
