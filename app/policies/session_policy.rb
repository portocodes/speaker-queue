class SessionPolicy < Struct.new(:current_user, :talk)
  def new?
    current_user.nil?
  end

  alias_method :create?, :new?

  def login?
    true
  end

  def destroy?
    current_user
  end
end
