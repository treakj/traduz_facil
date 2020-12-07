class JobsController < ApplicationController
  before_action :set_job, only: %i[show destroy]

  def index
    # @restaurants = Restaurant.all
    if params[:query].present?
      @jobs = policy_scope(Job.search_by_language(params[:query]))

    else
      @jobs = policy_scope(Job.all).order(created_at: :desc)
    end
  end

  def show
    @proposals = Proposal.where(job_id: @job.id).order(status: :asc)
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

  private

  def job_params
    params.require(:job).permit(:content)
  end

  def set_job
    @job = Job.find(params[:id])
    authorize @job
  end
end
