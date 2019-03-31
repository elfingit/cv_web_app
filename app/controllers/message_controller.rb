class MessageController < ApplicationController
  def create
    puts message_params.inspect
    @message = Message.new(message_params)
    if !@message.save
      render :json => { :errors => @message.errors.full_messages }, :status => 422
    else
      render :json => { :status => 'Ok'}
    end
  end

private
  def message_params
    params.required(:message).permit(:name, :email, :message)
  end
end
