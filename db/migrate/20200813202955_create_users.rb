class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.text :experience
      t.string :linkedin_url
      t.string :github_url

      t.timestamps
    end
  end
end
