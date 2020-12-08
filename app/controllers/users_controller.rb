class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @jobs = Job.where(user_id: @user.id)
    @proposals = Proposal.where(user_id: @user.id)
    
    if params[:filter].present?
      query = "proposals.user_id = ? AND proposals.status = ?"
      @proposals = Proposal.joins(:job).where(query, @user.id, params[:filter])
    end
    authorize @user
  end
end
