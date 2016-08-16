module Api
  class ApplicationController < ActionController::Base
    include Pundit

    private
    def current_user
      authenticate_or_request_with_http_token do |token, options|
        key = ApiKey.find_by_key(token)
        user = key.user if key
      end
    end

  end
end