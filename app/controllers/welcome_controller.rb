#coding: utf-8
#encoding: utf-8
class WelcomeController < ApplicationController
  def index
  end
  def page
    @page = Page.where(:name_url => params[:name_url]).first
    if params[:menu_url].to_s == "main"
      @menu = nil
    else
      @menu = MenuDown.where(:name_url => params[:menu_url]).first
    end
  end
  def menu
    @menu = MenuUp.where(:name_url => params[:name_url]).first
    unless @menu
      redirect_to root_path
      return
    end
  end
end