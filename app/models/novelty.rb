class Novelty < ActiveRecord::Base
  has_attached_file :image, :styles => {:thumb => "100x100>" }
end
