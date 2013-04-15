#coding: utf-8
#encoding: utf-8
class MenuDown < ActiveRecord::Base
  validates :name, :presence => true
  validates :menu_up, :presence => true
  validates :page, :presence => true
  belongs_to :page
  belongs_to :menu_up
  attr_accessible :name, :name_url, :page_id, :menu_up_id, :sort, :url, :external_url
  def name=(value)
    write_attribute :name_url, (Russian.translit(value).gsub(" ", "_").gsub(".","_dot_"))
    write_attribute :name, (value)
  end
end
