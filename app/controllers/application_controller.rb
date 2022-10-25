class ApplicationController < ActionController::Base
  # everything is an API in this demo
  skip_before_action :verify_authenticity_token
end
