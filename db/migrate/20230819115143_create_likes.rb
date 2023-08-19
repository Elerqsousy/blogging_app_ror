class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :User, null: false, foreign_key: {to_table: :users}, index: true
      t.references :Post, null: false, foreign_key: {to_table: :posts}, index: true

      t.timestamps
    end
  end
end
