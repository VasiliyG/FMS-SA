class NoveltyCategory < ActiveRecord::Base
  attr_accessible :title, :show_on_footer, :sort
  has_many :novelties
  default_scope :order => :sort
  def self.repair_sort( begin_sort, end_sort, forward)
    sort_sql=""
    sort_sql += "#{sort_sql == "" ? "" : " and "}sort<=#{end_sort} " unless end_sort.nil?
    sort_sql += "#{sort_sql == "" ? "" : " and "}sort>=#{begin_sort} " unless begin_sort.nil?
    update_all((forward)?"sort=sort+1":"sort=sort-1",sort_sql)
  end
  def initialize(*params)
    super(*params)
    if (@new_record)
      sort = NoveltyCategory.maximum('sort')
      self.sort = (sort.nil?) ? 0 : sort+1
    end
  end
  def resort_all
    old_sort=self.sort
    NoveltyCategory.repair_sort(old_sort, nil, false)
  end
end
