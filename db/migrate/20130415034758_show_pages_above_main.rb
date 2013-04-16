class ShowPagesAboveMain < ActiveRecord::Migration
  def change
    add_column :pages, :show_above_main, :boolean
  end
end
