class Admin::ApplicationController < ApplicationController
  before_action :basic_auth, if: :production?

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == Rails.application.credentials.basic_auth[:user_name] && password == Rails.application.credentials.basic_auth[:password]
    end
  end
end
