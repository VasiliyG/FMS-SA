class Novelty < ActiveRecord::Base
  has_attached_file :image, :styles => {:thumb => "100x100>", :for_main => "200x140>" }
  attr_accessible :title, :image, :preview, :body, :show_status, :novelty_category_id, :cool_news
  belongs_to :novelty_category
end
