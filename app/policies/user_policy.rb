class UserPolicy < Struct.new(:current_user, :talk)
  def show?
    current_user
  end

  def update?
    current_user
  end
end
