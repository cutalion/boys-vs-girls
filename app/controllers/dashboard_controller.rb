class DashboardController < ApplicationController
  def show
    @messages = Message.all

    respond_to do |format|
      format.html # dashboard.html.erb
      format.json { render json: @message }
  end
end
