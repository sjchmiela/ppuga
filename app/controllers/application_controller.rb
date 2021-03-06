# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)                                                                                                                      
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')                                            
    sign_up_url = url_for(:action => 'new', :controller => 'registrations', :only_path => false, :protocol => 'http')                                            
    if request.referer == sign_in_url   || request.referer == sign_up_url                                                                                                               
      super                                                                                                                                                 
    else                                                                                                                                                    
      request.referer || stored_location_for(resource) || homepage_path                                                                                         
    end                                                                                                                                                     
  end 

  private

  def authenticate_admin
    if !current_author.can_publish?
      flash[:notice] = "Ajajajaj, nieładnie. Tam nie wejdziesz, słoneczko."
      redirect_to homepage_path
    end
  end
end
