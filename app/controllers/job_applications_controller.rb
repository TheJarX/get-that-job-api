class JobApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :update, :destroy]
  before_action :require_either_user_or_company_login, only: [:index, :show]
  before_action :require_user_login, except: [:index, :show]

  # GET /applications
  # GET /applications.json
  def index
    @job = Job.find(params[:id])
    @applications = @Job.job_applications
    render :index
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # POST /applications
  # POST /applications.json
  def create
    @job = Job.find(params[:id])
    @application = @job.job_applications.new(application_params)
    @application.user_cv.attach(data: params[:user_cv])
    if @application.save
      @application = @job.job_applications.last
      render :show, status: :created
    else
      render json: @application.errors, status: 422
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    if @application.update(application_params)
      render :show, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @job = Job.find(params[:id])
      @application = @job.job_applications.find(params[:application_id])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.permit(:user_cv, :professional_experience, :reasons, :user_id)
    end
end
