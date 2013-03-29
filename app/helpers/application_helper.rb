# coding: utf-8
module ApplicationHelper
  def meta_title(title)
    content_for :meta_title do; title; end;
  end
end
