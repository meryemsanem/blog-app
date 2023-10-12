# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'Admin'
      can :manage, :all
    else
      can :read, :all
      can :manage, Post, author_id: user.id
    end
  end
end