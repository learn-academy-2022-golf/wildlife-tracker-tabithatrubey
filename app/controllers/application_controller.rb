class ApplicationController < ActionController::Base
    # disable Authenticity token to be able to create a new instance of animal in POSTMAN
    skip_before_action :verify_authenticity_token
end
