class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :name_url
      t.text :body
      t.timestamps
    end
  end
end
