class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :user_id, foreign_key: true
      t.string :category_id, foreign_key: true

      t.timestamps
    end
  end
end
