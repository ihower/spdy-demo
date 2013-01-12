# encoding: utf-8
class WelcomeController < ApplicationController

  caches_page :static


  def server_push
    push_associated_content([ 
                             [ApplicationController.helpers.asset_path("application.css"), 0], 
                             [ApplicationController.helpers.asset_path("application.js"), 1],
                           ] + $SUB_FLAGS.map{|c| [ApplicationController.helpers.asset_path("flags/#{c}"),2 ]})
  end

  protected

  def push_associated_content(resources)
    request.env['rack.associated_content.resources'] = resources
  end

end
