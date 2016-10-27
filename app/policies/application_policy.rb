class ApplicationPolicy
  attr_reader :user, :record

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    account_user_is_admin?
  end

  def show?
    account_user_is_admin?
  end

  def new?
    create?
  end

  def create?
    account_user_is_admin?
  end

  def edit?
    update?
  end

  def update?
    account_user_is_admin?
  end

  def destroy?
    account_user_is_admin?
  end

  private

    def account_user_is_admin?
      user.admin?
    end

end
