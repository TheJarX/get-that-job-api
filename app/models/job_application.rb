class JobApplication < ApplicationRecord
  validates :job, uniqueness: { scope: :user }
  validates :user_cv, presence:  true 
  belongs_to :job
  belongs_to :user
  has_one_base64_attached :user_cv

  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if user_cv.attached? && user_cv.content_type != 'application/pdf'
      errors.add(:user_cv, 'Must be a PDF')
    end
  end
  
end
