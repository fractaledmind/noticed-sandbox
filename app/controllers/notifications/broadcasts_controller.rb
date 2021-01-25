module Notifications
  class BroadcastsController < ApplicationController
    before_action :set_notification_broadcast, only: %w[ show edit update destroy ]

    # GET /notifications/broadcasts
    # GET /notifications/broadcasts.json
    def index
      @notification_broadcasts = Notifications::Broadcast.all
    end

    # GET /notifications/broadcasts/1
    # GET /notifications/broadcasts/1.json
    def show
    end

    # GET /notifications/broadcasts/new
    def new
      @notification_broadcast = Notifications::Broadcast.new
    end

    # GET /notifications/broadcasts/1/edit
    def edit
    end

    # POST /notifications/broadcasts
    # POST /notifications/broadcasts.json
    def create
      @notification_broadcast = Notifications::Broadcast.new(notification_broadcast_params)

      respond_to do |format|
        if @notification_broadcast.save
          format.html { redirect_to root_path, notice: "Notification broadcast was successfully created." }
          format.json { render :show, status: :created, location: @notification_broadcast }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @notification_broadcast.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /notifications/broadcasts/1
    # PATCH/PUT /notifications/broadcasts/1.json
    def update
      respond_to do |format|
        if @notification_broadcast.update(notification_broadcast_params)
          format.html { redirect_to @notification_broadcast, notice: "Notification broadcast was successfully updated." }
          format.json { render :show, status: :ok, location: @notification_broadcast }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @notification_broadcast.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /notifications/broadcasts/1
    # DELETE /notifications/broadcasts/1.json
    def destroy
      @notification_broadcast.destroy
      respond_to do |format|
        format.html { redirect_to notification_broadcasts_url, notice: "Notification broadcast was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_notification_broadcast
        @notification_broadcast = Notifications::Broadcast.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def notification_broadcast_params
        params.require(:notifications_broadcast).permit(:channel_id, :params)
      end
  end
end
