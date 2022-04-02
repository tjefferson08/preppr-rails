class ApplicationController < ActionController::Base
  before_action :authenticate_account!

  Account = Struct.new(:key, keyword_init: true)

  def authenticate_account!
    raise "No authenticated account!" unless current_account.key.present?
  end

  def current_account
    @current_account ||=
      begin
        return Account.new(key: "#{Rails.env}-#{request.host}") unless Rails.env.production?
        Account.new(key: request.headers["Cf-Access-Authenticated-User-Email"])
      end
  end

  helper_method :current_account
end
