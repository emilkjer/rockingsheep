
class HomeController < ApplicationController
  def index
    @interested = Interested.new
    respond_to do |format|
      format.html
    end
  end
end
