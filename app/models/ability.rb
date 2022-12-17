class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    can :read, Recipe, public: true
    return unless user.present?

    can :read, :all if user.role == 'guest'
    can(:manage, Recipe, user:)
    can(:manage, Inventory, user:)
    can(:manage, Food, user:)
    can :manage, :all if user.role == 'admin'
    can :manage, :all if user.role == 'default'
  end
end
