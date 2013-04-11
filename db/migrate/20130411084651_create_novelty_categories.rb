class CreateNoveltyCategories < ActiveRecord::Migration
  def change
    create_table :novelty_categories do |t|
      t.string :title
      t.boolean :show_on_footer
      t.integer :sort, :default => 0
      t.timestamps
    end
    add_column :novelties, :novelty_category_id, :integer
  end
end
