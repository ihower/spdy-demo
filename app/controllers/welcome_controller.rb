# encoding: utf-8
class WelcomeController < ApplicationController

  before_filter :set_countries_image
  caches_page :static


  def server_push
    push_associated_content([ 
                             [ApplicationController.helpers.asset_path("application.css"), 0], 
                             [ApplicationController.helpers.asset_path("application.js"), 1],
                           ] + $countries_image.map{|c| [ApplicationController.helpers.asset_path("flags/#{c}"),2 ]})
  end

  protected

  def push_associated_content(resources)
    request.env['rack.associated_content.resources'] = resources
  end

  def set_countries_image
    $countries_image = $FLAGS.sample(90)
  end

end
