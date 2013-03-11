class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @message = Message.new(params[:message])
    @message.user_id = current_user.id
    if @message.save
      redirect_to root_path, :notice => 'Message was successfully created'
    else
      render :action => 'dashboard/show'
    end
  end
end
