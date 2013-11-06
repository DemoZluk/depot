class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, id: false, primary_key: :id do |t|
      t.string :id
      t.string :title
      t.string :parent_id
      t.string :permalink

      t.timestamps
    end
  end
end