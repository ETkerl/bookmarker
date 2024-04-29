class SwaggerController < ActionController::Base
  def index
    render html: nil, layout: 'swagger'
  end
end
