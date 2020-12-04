class ProposalsController < ApplicationController
  
  before_action :set_proposal, only: [:edit, :update]

  def new
    @proposal = Proposal.new
  end

  def create
    @job = Job.find(params[:id])
    @proposal = Proposal.new(proposal_creation_status_params)
    @proposal.job_id = @job.id
    @proposal.save
  
  def edit
    @job = Job.find(params[:job_id])
  end

  def update
    @proposal.update(proposal_status_params)

    @job = Job.find(params[:job_id])
    redirect_to @job
  end

  private

      
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
