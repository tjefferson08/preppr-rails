class ApplicationController < ActionController::Base
  before_action :ensure_hostname!
  before_action :authenticate_account!

  Account = Struct.new(:key, keyword_init: true)

  def authenticate_account!
    raise "No authenticated account!" unless current_account.key.present?
  end

  def ensure_hostname!
    return unless Rails.env.production?

    return if request.host == "preppr.travisjefferson.com"
    redirect_to "https://preppr.travisjefferson.com", allow_other_host: true
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
