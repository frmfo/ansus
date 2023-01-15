class WeighingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.has_role?(:gerenciador) || user.has_role?(:controlador) || user.has_role?(:pesagem)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

  def index?
    user.admin? || user.has_role?(:gerenciador) || user.has_role?(:controlador) || user.has_role?(:pesagem)
  end

  def create?
    user.admin? || user.has_role?(:gerenciador) || user.has_role?(:controlador) || user.has_role?(:pesagem)
  end

  def new?
    user.admin? || user.has_role?(:gerenciador) || user.has_role?(:controlador) || user.has_role?(:pesagem)
  end

  def update?
    user.admin? || user.has_role?(:gerenciador) || user.has_role?(:controlador) || user.has_role?(:pesagem)
  end

  def destroy?
    user.admin? || user.has_role?(:gerenciador) || user.has_role?(:controlador)
  end

  def edit?
    user.admin? || user.has_role?(:gerenciador) || user.has_role?(:controlador) || user.has_role?(:pesagem)
  end

  def show?
    user.admin? || user.has_role?(:gerenciador) || user.has_role?(:controlador) || user.has_role?(:pesagem)
  end
end
