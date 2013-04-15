class CreateMenuUps < ActiveRecord::Migration
  def change
    create_table :menu_ups do |t|
      t.string :name
      t.string :name_url
      t.text :body
      t.integer :sort
      t.string :url
      t.boolean :external_url
      t.timestamps
    end
  end
end
