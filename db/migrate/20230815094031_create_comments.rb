class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author_id, foreign_key: { to_table: :users }
      t.references :post_id, foreign_key: { to_table: :posts }
      t.text :text

      t.timestamps
    end
  end
end
