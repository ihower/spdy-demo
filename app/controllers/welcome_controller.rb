class WelcomeController < ApplicationController

  def server_push    
    set_associated_content([ApplicationController.helpers.asset_path("application.css"), 
                            ApplicationController.helpers.asset_path("application.js")                           
                           ] + COUNTRIES_IMAGE.map{|c| ApplicationController.helpers.asset_path("flags/#{c}")},
                           "https://www.ihower.tw" )
  end

  def no_server_push

  end

  protected

  def set_associated_content(urls, domain)
    response.headers["X-Associated-Content"] = urls.map{ |u| "\"#{domain}#{u}\"" }.join(",")
  end

end
