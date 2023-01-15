class BranchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.has_role?(:administrador)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

  def index?
    user.admin? || user.has_role?(:administrador)
  end

  def create?
    user.admin? || user.has_role?(:administrador)
  end

  def new?
    user.admin? || user.has_role?(:administrador)
  end

  def update?
    user.admin? || user.has_role?(:administrador)
  end

  def destroy?
    user.admin? || user.has_role?(:administrador)
  end

  def edit?
    user.admin? || user.has_role?(:administrador)
  end

end
