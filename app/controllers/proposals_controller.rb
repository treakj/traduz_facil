class ProposalsController < ApplicationController
  before_action :set_proposal, only: %i[edit update]
  before_action :set_job, only: %i[new create edit update]

  def new
    @proposal = Proposal.new
  end

  def create
    @job = Job.find(params[:job_id])
    @proposal = Proposal.new(proposal_creation_status_params)
    @proposal.job_id = @job.id
    @proposal.user_id = current_user.id
    @proposal.status = "pending"

    if @proposal.save
      redirect_to @job, notice: "The proposal was successfully created."
    else
      render :new
    end
  end

  def edit
    @date = "#{@proposal.deadline.strftime('%d.%m.%Y')} (#{(Date.today - @proposal.deadline).ceil.abs} days)"
  end

  def update
    @proposal.update(proposal_status_params)
    redirect_to @job, notice: "The proposal was successfully updated."
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    if current_user.admin || @proposal.user_id == current_user.id
      @proposal.delete
      redirect_to user_path(current_user), notice: "The proposal was successfully deleted."
    end
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def proposal_creation_status_params
    params.require(:proposal).permit(:price, :deadline)
  end

  def proposal_status_params
    params.require(:proposal).permit(:status)
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
    authorize @proposal
  end
end
