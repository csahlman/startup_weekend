class InquiriesController < ApplicationController

  def create
    @inquiry = Inquiry.new inquiry_params
    @inquiry.ip_address = request.remote_ip
    @inquiry.save!
    respond_to do |f|
      f.js { }
    end
  end


  private

    def inquiry_params
      params.require(:inquiry).permit(:current_zip, :future_zip, :date) 
    end
end