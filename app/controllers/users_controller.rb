class UsersController < ApplicationController
  
  def myjobs
    @myproposals = Proposal.where(user_id: params[:user_id], status: "accepted")
    authorize @myproposals
  end

  def show
    @user = User.find(params[:id])
    @jobs = Job.where(user_id: @user.id)
    @proposals = Proposal.where(user_id: @user.id)
    
    if params[:filter].present?
      # @user_filter = User.find(params[:id]) # Tem lá fora
      # @proposals = Proposal.where(status: params[:filter]) # Tem lá fora
      # @proposals = Proposal.where(user_id: @user_filter.id).where(status: params[:filter])
      query = "proposals.user_id = ? AND proposals.status = ?"
      @jobs = Proposal.joins(:job).where(query, @user.id, params[:filter])
    # else
    #   @user = User.find(params[:id])
    #   @jobs = Job.where(user_id: @user.id)
    #   @proposals = Proposal.where(user_id: @user.id)
    end
    authorize @user
  end
end
