class HomeController < ApplicationController
  def index
    @interested = Interested.new


    flash[:notice] = ""
    if not params[:notice].nil? then
      flash[:notice] = params[:notice]
    end
    
    respond_to do |format|
      format.html
    end
  end
end