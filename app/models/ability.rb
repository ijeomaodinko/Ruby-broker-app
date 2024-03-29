# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    # User ||= User.new #guest user (not logged in)
    can :read, Product, public: true
    can :read, Company, public: true
    can :read, Category, public: true
    if user.persisted?
      can :create, Order
      can :read, Order, user_id: user.id
    end

    if user.seller?
      can :create, Product
    end
    
    can :manage, :all if user.role = "admin"
  end
end
