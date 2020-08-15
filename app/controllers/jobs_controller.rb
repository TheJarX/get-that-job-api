class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]
  before_action :require_company_login, except: [:index, :show]
  # GET /jobs
  def index
    @jobs = Job.all

    render :index
  end

  # GET /jobs/1
  def show
    render :show
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render :show
    else
      head(:unprocessable_entity)
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render :show
    else
      head(:unprocessable_entity)
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:title, :job_type, :seniority, :salary, :location, :introduction, :from_candidate, :candidate_profile, :job_requirements, :company_id)
    end
end
