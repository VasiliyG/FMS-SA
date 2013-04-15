class CreateMenuDowns < ActiveRecord::Migration
  def change
    create_table :menu_downs do |t|
      t.string :name
      t.string :name_url
      t.integer :sort
      t.string :url
      t.boolean :external_url
      t.integer :page_id
      t.integer :menu_up_id
      t.timestamps
    end
  end
end
