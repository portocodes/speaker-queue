class TalkPolicy < Struct.new(:current_user, :talk)
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    current_user&.name.present?
  end

  def update?
    current_user.admin? || talk.user == current_user
  end

  alias_method :edit?, :update?

  def destroy?
    false
  end
end
