class UsersController < ApplicationController
  def myjobs



    # @proposals = policy_scope(Proposal)
    # @props = policy_scope(Proposal).where(proposal.user_id == current_user)
    # .where(current_user == proposal.user_id && proposal.status == "accepted")
    # @jobs = policy_scope(Job).where(@prop.job_id == :id)
    # authorize @job

    # proposals.select do |proposal|
      
      
      # all_jobs.each do |job|
      #   proposal.job_id == 
      # end
    # end

    # @jobs = policy_scope(Job).where(proposals.user_id == current_user)
    # @jobs = policy_scope(Job).find(@proposal.job_id).where(@proposal.user_id == current_user)
    # .order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @jobs = Job.where(user_id: @user.id)
    @proposals = Proposal.where(user_id: @user.id)
    authorize @user
  end
end
