class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    alias_action :index, :show, :create, :update, :edit, :destroy, :to => :crud

    if user.master?
        master
    elsif user.admin?
        admin
    elsif user.speaker?
        speaker
    else
        guest
    end

    def master
        can :manage, User
        cannot :manage, Talk
    end

    def admin
        can :manage, Talk
        cannot :manage, User
    end

    def speaker
        can :crud, Talk do |t|
            t.user == current_user
        end
    end

    def guest
        can :read, Talk
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
