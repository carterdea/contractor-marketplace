class Contractor < ActiveRecord::Base
  belongs_to :user, touch: true, dependent: :destroy
end
