module Notifications
  class ChannelsController < ApplicationController
    before_action :set_notification_channel, only: %w[ show edit update destroy ]

    # GET /notifications/channels
    # GET /notifications/channels.json
    def index
      @notification_channels = Notifications::Channel.all
    end

    # GET /notifications/channels/1
    # GET /notifications/channels/1.json
    def show
    end

    # GET /notifications/channels/new
    def new
      @notification_channel = Notifications::Channel.new
    end

    # GET /notifications/channels/1/edit
    def edit
    end

    # POST /notifications/channels
    # POST /notifications/channels.json
    def create
      @notification_channel = Notifications::Channel.new(notification_channel_params)

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

    # PATCH/PUT /notifications/channels/1
    # PATCH/PUT /notifications/channels/1.json
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

    # DELETE /notifications/channels/1
    # DELETE /notifications/channels/1.json
    def destroy
      @notification_channel.destroy
      respond_to do |format|
        format.html { redirect_to notifications_channels_url, notice: "Notification channel was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_notification_channel
        @notification_channel = Notifications::Channel.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def notification_channel_params
        params.require(:notifications_channel).permit(:name, :subject_template, :body_template)
      end
  end
end
