class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :Text
      t.integer :CommentsCounter
      t.integer :LikeCounter
      t.references :Author, null: false, foreign_key: {to_table: :users}, index: true

      t.timestamps
    end
  end
end
