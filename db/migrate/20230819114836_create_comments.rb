class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :Text
      t.references :User, null: false, foreign_key: {to_table: :users}, index: true
      t.references :Post, null: false, foreign_key: {to_table: :posts}, index: true

      t.timestamps
    end
  end
end
