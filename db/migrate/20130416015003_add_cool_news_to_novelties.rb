class AddCoolNewsToNovelties < ActiveRecord::Migration
  def change
    add_column :novelties, :cool_news, :boolean, :default => false
  end
end
