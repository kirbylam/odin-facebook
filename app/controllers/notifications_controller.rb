class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.received_notifications
  end

  def create
    @notification = Notification.new(friend_request: params[:friend_request])
    @notification.receiver = User.find(params[:receiver])
    @notification.sender = User.find(params[:sender])

    @notification.save
  end

  private
    def notification_params
      params.permit(:receiver, :sender, :friend_request)
    end
end
