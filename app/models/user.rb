class User < ApplicationRecord
  include Signupable

  has_one :project, dependent: :destroy

  def needs_to_activate?
    valid_password?('password')
  end

  def activated?
    !needs_to_activate?
  end
end
