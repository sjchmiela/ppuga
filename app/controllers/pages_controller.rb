# encoding: utf-8
class PagesController < ApplicationController
  respond_to :html
  def sissy
  	responds = [
  		"Szkoda, ale było miło.",
  		"Ale ciota!",
  		"No trudno, do zobaczenia innym razem.",
  		"Znajdziemy Cię, a wtedy..."
  	]
  	flash[:notice] = responds[Random.rand(5)]
  	redirect_to homepage_path
  end
end
