class User < ApplicationRecord
  enum role: { user: 0, seller: 1, admin: 2 }
after_initialize :set_default_role, :if => :new_record?

has_many :orders, dependent: :destroy

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

def set_default_role
  self.role  ||= :user
end
end
