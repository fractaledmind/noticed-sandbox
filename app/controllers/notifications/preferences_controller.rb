module Notifications
  class PreferencesController < ApplicationController
    before_action :set_notification_preference, only: %w[ show edit update destroy ]

    # GET /notifications/preferences
    # GET /notifications/preferences.json
    def index
      @notification_preferences = Notifications::Preference.all
    end

    # POST /notifications/preferences
    # POST /notifications/preferences.json
    def create
      @notification_preference = Notifications::Preference.new(notification_preference_params)

      respond_to do |format|
        if @notification_preference.save
          format.html { redirect_to notifications_preferences_path, notice: "Notification preference was successfully created." }
          format.json { render :show, status: :created, location: @notification_preference }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @notification_preference.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /notifications/preferences/1
    # PATCH/PUT /notifications/preferences/1.json
    def update
      respond_to do |format|
        if @notification_preference.update(notification_preference_params)
          format.html { redirect_to notifications_preferences_path, notice: "Notification preference was successfully updated." }
          format.json { render :show, status: :ok, location: @notification_preference }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @notification_preference.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /notifications/preferences/1
    # DELETE /notifications/preferences/1.json
    def destroy
      @notification_preference.destroy
      respond_to do |format|
        format.html { redirect_to notifications_preferences_url, notice: "Notification preference was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_notification_preference
        @notification_preference = Notifications::Preference.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def notification_preference_params
        params.require(:notifications_preference).permit(:channel_id, :user_id, :local, :email)
      end
  end
end
