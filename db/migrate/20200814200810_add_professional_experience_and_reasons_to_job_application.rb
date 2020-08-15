class AddProfessionalExperienceAndReasonsToJobApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :professional_experience, :text
    add_column :job_applications, :reasons, :text
  end
end
