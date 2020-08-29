class JobApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :update, :destroy]
  before_action :require_either_user_or_company_login, only: [:index, :show]
  before_action :require_user_login, except: [:index, :show]

  # GET /applications
  # GET /applications.json
  def index
    @job = Job.find(params[:id])
    @applications = @job.job_applications
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
    def permitted_params
      params.permit(:userCv, :professionalExperience, :reasons, :userId)
    end
    def application_params
      permitted_params.to_enum.to_h.entries.reduce({}){|acc, entrie| 
        acc[entrie.first.to_s.underscore.to_sym] = entrie.last
        acc
      }
    end
end
