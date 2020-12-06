class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @jobs = Job.where(user_id: @user.id)
    @proposals = Proposal.where(user_id: @user.id)
    authorize @user
  end

  def edit

  end

end
