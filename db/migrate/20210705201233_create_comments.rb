class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
