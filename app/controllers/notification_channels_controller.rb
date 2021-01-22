class NotificationChannelsController < ApplicationController
  before_action :set_notification_channel, only: %w[ show edit update destroy ]

  # GET /notification_channels
  # GET /notification_channels.json
  def index
    @notification_channels = NotificationChannel.all
  end

  # GET /notification_channels/1
  # GET /notification_channels/1.json
  def show
  end

  # GET /notification_channels/new
  def new
    @notification_channel = NotificationChannel.new
  end

  # GET /notification_channels/1/edit
  def edit
  end

  # POST /notification_channels
  # POST /notification_channels.json
  def create
    @notification_channel = NotificationChannel.new(notification_channel_params)

    respond_to do |format|
      if @notification_channel.save
        format.html { redirect_to @notification_channel, notice: "Notification channel was successfully created." }
        format.json { render :show, status: :created, location: @notification_channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notification_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_channels/1
  # PATCH/PUT /notification_channels/1.json
  def update
    respond_to do |format|
      if @notification_channel.update(notification_channel_params)
        format.html { redirect_to @notification_channel, notice: "Notification channel was successfully updated." }
        format.json { render :show, status: :ok, location: @notification_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notification_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_channels/1
  # DELETE /notification_channels/1.json
  def destroy
    @notification_channel.destroy
    respond_to do |format|
      format.html { redirect_to notification_channels_url, notice: "Notification channel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_channel
      @notification_channel = NotificationChannel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_channel_params
      params.require(:notification_channel).permit(:name, :subject_template, :body_template)
    end
end
