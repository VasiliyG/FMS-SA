#coding: utf-8
#encoding: utf-8
class Page < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :name, :presence => true
  has_many :menu_downs
  attr_accessible :name, :name_url, :body, :show_above_main
  def name=(value)
    write_attribute :name_url, (Russian.translit(value).gsub(" ", "_").gsub(".","_dot_"))
    write_attribute :name, (value)
  end
end
