class JobApplication < ApplicationRecord
  validates :job, uniqueness: { scope: :user }
  belongs_to :job
  belongs_to :user
end
