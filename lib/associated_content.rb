module Rack

  class AssociatedContent

    def initialize(app, variation=nil)
      @app = app
      @variation = variation
    end

    def call(env)
      type = variation(env)
      req = Rack::Request.new(env)
      
      status, headers, body = @app.call(env)
      associated_content_resources = env['rack.associated_content.resources']

      if associated_content_resources
        headers[type] = associated_content_resources.map{ |u| "\"https://#{req.host_with_port}#{u[0]}\":#{u[1]}" }.join(",")
      end

      [status, headers, body]
    end

    private

    def variation(env)
      @variation ||
        env['associated_content.type'] ||
        env['HTTP_X_ASSOCIATED_CONTENT_TYPE'] ||
        "X-Associated-Content"
    end

  end
end