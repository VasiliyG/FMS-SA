#coding: utf-8
#encoding: utf-8
class NoveltiesController < ApplicationController
  def index
    cat_temp = NoveltyCategory.order(:sort).first
    unless cat_temp
      redirect_to root_path
      return
    end
    cat_id = (params[:id].to_i > 0 ? params[:id].to_i : cat_temp.id)
    @novelties = Novelty.where(:show_status => true, :novelty_category_id => cat_id).paginate(:per_page => 10, :page => params[:page])
  end
  def show
    @novelty = Novelty.find_by_id(params[:id])
    unless @novelty
      redirect_to root_path
      return
    end
  end
end
