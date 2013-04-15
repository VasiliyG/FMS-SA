#coding: utf-8
#encoding: utf-8
ActiveAdmin.register MenuDown do
  config.sort_order = "sort DESC"
  filter :name
  filter :page
  filter :menu_up
  filter :created_at
  filter :updated_at
  index do
    column :name
    column :page
    column :menu_up
    column "Сортировка", :sortable => 'menu_ups.sort' do |item|
      out = ""
      out += (link_to image_tag("2uparrow.png"), :action => "to_home", :id=>item.id) unless item.sort == 0
      out += (link_to image_tag("1uparrow.png"), :action => "to_up", :id=>item.id) unless item.sort == 0
      out += (link_to image_tag("1downarrow.png"),:action => "to_down", :id=>item.id) unless item.sort == MenuDown.maximum('sort')
      out += (link_to image_tag("2downarrow.png"),:action => "to_end", :id=>item.id) unless item.sort == MenuDown.maximum('sort')
      out.html_safe
    end
    column :created_at
    column :updated_at
    default_actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "" do
        f.input :name
        f.input :page
        f.input :menu_up
        f.input :url
        f.input :external_url
      end
      f.buttons
  end
  member_action :to_up do
    move(-1)
    redirect_to :action=>'index'
  end
  member_action :to_down do
    move(1)
    redirect_to :action=>'index'
  end
  member_action :to_home do
    banner = MenuDown.find(params[:id])
    old_sort = banner.sort
    banner.sort = -1
    if(banner.save)
      MenuDown.repair_sort(-1, old_sort, true);
    else
      flash[:notice] = "Не возможно переместить"
    end
    redirect_to :action=>'index'
  end
  member_action :to_end  do
    banner = MenuDown.find(params[:id])
    sort = MenuDown.maximum('sort')
    old_sort = banner.sort
    banner.sort = (sort.nil?) ? 0 : sort+1
    if(banner.save)
      MenuDown.repair_sort( old_sort, nil, false);
    else
      flash[:notice] = "Не возможно переместиь"
    end
    redirect_to :action=>'index'
  end
  controller do
    def move( direction )
      banner = MenuDown.find(params[:id])
      banner_other = MenuDown.find_by_sort(banner.sort+direction)
      if banner_other
        banner.update_attribute('sort',banner.sort+direction)
        banner_other.update_attribute('sort',banner.sort-direction)
      else
        flash[:notice] = "Не возможно переместить"
      end
  #    redirect_to(:action =>:index)

    end
  end
end
