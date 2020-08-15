class JobApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :update, :destroy]

  # GET /applications
  # GET /applications.json
  def index
    @applications = Job.find(params[:id]).job_applications
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
    
    if @job.job_applications.create!(application_params)
      @application = @job.job_applications.last
      render :show, status: :created, location: @application
    else
      head(:unprocessable_entity)
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    if @application.update(application_params)
      render :show, status: :ok, location: @application
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
      params.require(:job_application).permit(:professional_experience, :reasons, :user_id)
    end
end
