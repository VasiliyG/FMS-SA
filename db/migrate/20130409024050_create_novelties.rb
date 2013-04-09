class CreateNovelties < ActiveRecord::Migration
  def change
    create_table :novelties do |t|
      t.string :title
      t.text :preview
      t.text :body
      t.boolean :show_status
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end
end
