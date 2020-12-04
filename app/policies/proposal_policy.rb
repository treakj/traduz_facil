class ProposalPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, record)
      @user = user
      @record = record
    end

    def create?
      true
    end

    def resolve
      scope.all
    end
  end

  def update?
    admin_or_owner?
  end

  private

  def admin_or_owner?
    user.admin || user == Job.find(record.job_id).user_id
  end
end
