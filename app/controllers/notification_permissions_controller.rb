class NotificationPermissionsController < ApplicationController
  before_action :set_notification_permission, only: %w[ show edit update destroy ]

  # GET /notification_permissions
  # GET /notification_permissions.json
  def index
    @notification_permissions = NotificationPermission.all
  end

  # POST /notification_permissions
  # POST /notification_permissions.json
  def create
    @notification_permission = NotificationPermission.new(notification_permission_params)

    respond_to do |format|
      if @notification_permission.save
        format.html { redirect_to notification_permissions_path, notice: "Notification permission was successfully created." }
        format.json { render :show, status: :created, location: @notification_permission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notification_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_permissions/1
  # PATCH/PUT /notification_permissions/1.json
  def update
    respond_to do |format|
      if @notification_permission.update(notification_permission_params)
        format.html { redirect_to notification_permissions_path, notice: "Notification permission was successfully updated." }
        format.json { render :show, status: :ok, location: @notification_permission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notification_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_permissions/1
  # DELETE /notification_permissions/1.json
  def destroy
    @notification_permission.destroy
    respond_to do |format|
      format.html { redirect_to notification_permissions_url, notice: "Notification permission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_permission
      @notification_permission = NotificationPermission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_permission_params
      params.require(:notification_permission).permit(:channel_id, :user_id, :local, :email)
    end
end
