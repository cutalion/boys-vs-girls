class DashboardController < ApplicationController
  def show
    @messages = Message.latest(20)
    respond_to do |format|
      format.html # dashboard.html.erb
      format.json { render json: @message }
    end
  end
end
