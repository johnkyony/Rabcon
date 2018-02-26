class QrCodesController < ApplicationController
  def new
     @qr = RQRCode::QRCode.new( params[:user_id] , size: 4)
    
  end

  # def create
  #   @qr = RQRCode::QRCode.new( qr_code_params[:user_id] , size: 4)
  # end
  
  private 
  
   def qr_code_params
     params.require(:qr_code).permit(:text , :user_id)
   end
end
