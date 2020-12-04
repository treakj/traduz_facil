class JobsController < ApplicationController
  
  before_action :set_job, only: [:show, :destroy, :my_jobs]

  def index
    # @restaurants = Restaurant.all
    @jobs = policy_scope(Job).order(created_at: :desc)
  end

  def show
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job

    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: 'Job was successfully destroyed.'
  end

  # ==>> CONTINUAR <<===
  def my_jobs
    @jobs = policy_scope(Job).find(@proposal.job_id).where(@proposal.user_id == current_user)
    # .order(created_at: :desc)
  end

  private

  def job_params
    params.require(:job).permit(:content)
  end

  def set_job
    @job = Job.find(params[:id])
    authorize @job
  end
end
