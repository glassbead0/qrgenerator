class WelcomeController < ApplicationController
  def index
  end

  def create_qr_code
    @qr = RQRCode::QRCode.new( params[:qr_code], :size => 6, :level => :h )
  end


end
