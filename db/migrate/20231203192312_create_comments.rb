class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :user_comment
      t.boolean :rating
      t.boolean :user_recommended
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end