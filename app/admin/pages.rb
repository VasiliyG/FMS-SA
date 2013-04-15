#coding: utf-8
#encoding: utf-8
ActiveAdmin.register Page do
  filter :name
  filter :created_at
  filter :updated_at
  index do
    column :name
    column :show_above_main
    column :created_at
    column :updated_at
    default_actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "" do
        f.input :name
        f.input :show_above_main
        f.input :body, :as => :ckeditor
      end
      f.buttons
  end

end
