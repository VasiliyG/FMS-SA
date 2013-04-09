#coding: utf-8
#encoding: utf-8
ActiveAdmin.register Novelty do
  menu :parent => "Новости"
  filter :title
  filter :preview
  filter :body
  filter :created_at
  filter :updated_at
  index do
    column :title
    column :image do |item|
       image_tag item.image.url(:thumb)
      end
    column :show_status do |item|
      item.show_status ? "Выводить" : "Спрятать"
    end
    column :created_at
    column :updated_at
    default_actions
  end
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "" do
        f.input :title
        f.input :image, :multipart => true , :hint => f.template.image_tag(f.object.image.url(:thumb))+(f.object.new_record? ? "" : (link_to "Удалить", "/admin/novelties/#{f.object.id}/remove_img"))
        f.input :preview, :input_html => {:class => 'editor'}
        f.input :body, :input_html => {:class => 'editor'}
        f.input :show_status
      end
      f.buttons
  end
  member_action :remove_img do
    novelty = Novelty.find_by_id(params[:id])
    novelty.image.clear
    novelty.save
    redirect_to :back
  end
end
