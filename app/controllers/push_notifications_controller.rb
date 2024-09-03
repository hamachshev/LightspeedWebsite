class PushNotificationsController < ApplicationController
  before_action :set_push_notification, only: %i[ show edit update destroy ]

  # GET /push_notifications or /push_notifications.json
  def index
    @push_notifications = PushNotification.all
  end

  # GET /push_notifications/1 or /push_notifications/1.json
  def show
  end

  # GET /push_notifications/new
  def new
    @push_notification = PushNotification.new
    @users = User.all
  end

  # GET /push_notifications/1/edit
  def edit
  end

  # POST /push_notifications or /push_notifications.json
  def create
    @users = User.all
    device_token = User.find(push_notification_params[:user]).device_token
    notification       = Apnotic::Notification.new("580c430794a298552578b380bf6fc07abc6bb0135f1a0b6bcf86bf8efc498ec8")
    notification.alert = "Notification from Apnotic!"
    # send (this is a blocking call)
    response = APNS_CONNECTION.push(notification)

    @push_notification = PushNotification.new(push_notification_params.except(:user))

    respond_to do |format|
      if @push_notification.save && response.ok? == true
        format.html { redirect_to push_notification_url(@push_notification), notice: "Push notification was successfully created." }
        format.json { render :show, status: :created, location: @push_notification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @push_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /push_notifications/1 or /push_notifications/1.json
  def update
    respond_to do |format|
      if @push_notification.update(push_notification_params)
        format.html { redirect_to push_notification_url(@push_notification), notice: "Push notification was successfully updated." }
        format.json { render :show, status: :ok, location: @push_notification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @push_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_notifications/1 or /push_notifications/1.json
  def destroy
    @push_notification.destroy

    respond_to do |format|
      format.html { redirect_to push_notifications_url, notice: "Push notification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_push_notification
      @push_notification = PushNotification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def push_notification_params
      params.require(:push_notification).permit(:title, :body, :badge, :sound, :user)
    end
end
