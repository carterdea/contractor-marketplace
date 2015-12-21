class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :contractor, dependent: :destroy

  validates :email, uniqueness: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes['password'] }
end
