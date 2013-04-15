#coding: utf-8
#encoding: utf-8
class MenuUp < ActiveRecord::Base
  validates :name, :presence => true
  default_scope :order => :sort
  has_many :menu_downs
  attr_accessible :name, :name_url, :body, :sort, :url, :external_url
  def name=(value)
    write_attribute :name_url, (Russian.translit(value).gsub(" ", "_").gsub(".","_dot_"))
    write_attribute :name, (value)
  end
  def self.repair_sort( begin_sort, end_sort, forward)
    sort_sql=""
    sort_sql += "#{sort_sql == "" ? "" : " and "}sort<=#{end_sort} " unless end_sort.nil?
    sort_sql += "#{sort_sql == "" ? "" : " and "}sort>=#{begin_sort} " unless begin_sort.nil?
    update_all((forward)?"sort=sort+1":"sort=sort-1",sort_sql)
  end
  def initialize(*params)
    super(*params)
    if (@new_record)
      sort = MenuUp.maximum('sort')
      self.sort = (sort.nil?) ? 0 : sort+1
    end
  end
  def resort_all
    old_sort=self.sort
    MenuUp.repair_sort(old_sort, nil, false)
  end
end
