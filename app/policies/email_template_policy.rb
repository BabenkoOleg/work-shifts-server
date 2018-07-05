class EmailTemplatePolicy < ApplicationPolicy
  def index?
    current_user.administrator?
  end

  def update?
    current_user.administrator?
  end

  def edit?
    current_user.administrator?
  end

  def restore_template?
    current_user.administrator?
  end

  def scope
    Pundit.policy_scope!(current_user, record.class)
  end

  class Scope
    attr_reader :current_user, :scope

    def initialize(current_user, scope)
      @current_user = current_user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
