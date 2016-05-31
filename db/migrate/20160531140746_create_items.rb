class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.belongs_to :parent
      t.integer :position

      t.timestamps null: false
    end
  end
end
