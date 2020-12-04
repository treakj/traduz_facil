class JobsController < ApplicationController
  
  before_action :set_job, only: [:show]

  def index
    # @restaurants = Restaurant.all
    @restaurants = policy_scope(Job).order(created_at: :desc)
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
      # redirect_to job_path(@job)
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end

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
