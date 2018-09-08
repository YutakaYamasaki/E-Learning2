class CreateWordAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :word_answers do |t|
      t.string :word_id,foreign_key: true
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
