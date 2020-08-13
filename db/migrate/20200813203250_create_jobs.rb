class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :type
      t.string :seniority
      t.float :salary
      t.string :location
      t.text :introduction
      t.text :from_candidate
      t.text :candidate_profile
      t.text :job_requirements
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
