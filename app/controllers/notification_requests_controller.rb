class NotificationRequestsController < ApplicationController
  before_action :set_notification_request, only: %w[ show edit update destroy ]

  # GET /notification_requests
  # GET /notification_requests.json
  def index
    @notification_requests = NotificationRequest.all
  end

  # GET /notification_requests/1
  # GET /notification_requests/1.json
  def show
  end

  # GET /notification_requests/new
  def new
    @notification_request = NotificationRequest.new
  end

  # GET /notification_requests/1/edit
  def edit
  end

  # POST /notification_requests
  # POST /notification_requests.json
  def create
    @notification_request = NotificationRequest.new(notification_request_params)

    respond_to do |format|
      if @notification_request.save
        format.html { redirect_to @notification_request, notice: "Notification request was successfully created." }
        format.json { render :show, status: :created, location: @notification_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notification_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_requests/1
  # PATCH/PUT /notification_requests/1.json
  def update
    respond_to do |format|
      if @notification_request.update(notification_request_params)
        format.html { redirect_to @notification_request, notice: "Notification request was successfully updated." }
        format.json { render :show, status: :ok, location: @notification_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notification_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_requests/1
  # DELETE /notification_requests/1.json
  def destroy
    @notification_request.destroy
    respond_to do |format|
      format.html { redirect_to notification_requests_url, notice: "Notification request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_request
      @notification_request = NotificationRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_request_params
      params.require(:notification_request).permit(:channel_id, :params)
    end
end
