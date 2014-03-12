class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :slug
      t.string :work
      t.string :work_title
      t.string :personal_project
      t.string :twitter
      t.string :linkedin
      t.string :github
      t.string :profile_image
      t.string :background_image
      t.string :quote
      t.text :bio
      t.text :education
      t.timestamps
    end
  end
end