# coding: utf-8
module ApplicationHelper
  def meta_title(title)
    content_for :meta_title do; title; end;
  end
  def menu(options = {})
     content_for(:menu, render( :partial => "menu/menu", :locals => {:options => options} ))
  end
end
