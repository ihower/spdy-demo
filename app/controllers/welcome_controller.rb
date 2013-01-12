# encoding: utf-8
class WelcomeController < ApplicationController

  caches_page :static


  def server_push
    push_associated_content([ 
                             [ApplicationController.helpers.asset_path("application.css"), 0], 
                             [ApplicationController.helpers.asset_path("application.js"), 1],
                             [ApplicationController.helpers.asset_path("flags/Taiwan.png"), 2],
                           ] + $SUB_FLAGS.map{|c| [ApplicationController.helpers.asset_path("flags/#{c}"),[3,4,5,6,7].sample ]})
  end

  protected

  def push_associated_content(resources)
    request.env['rack.associated_content.resources'] = resources
  end

end
