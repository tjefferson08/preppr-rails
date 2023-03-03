class ApplicationController < ActionController::Base
  protected

  def authenticate_account!
    redirect_to sign_in_path unless current_account
  end

  def current_account
    return unless session[:account_id]

    @current_account ||= Account.find_by(id: session[:account_id])
  end

  def not_found
    render file: Rails.root.join("public", "404.html"), status: :not_found
  end
end
