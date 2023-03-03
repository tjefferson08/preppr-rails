class SessionsController < ApplicationController
  layout -> { ApplicationLayout }

  def new
    render Authn::SignInPageComponent.new
  end

  def create
    account = Account.authenticate_by(email: session_params[:email].downcase, password: session_params[:password])

    if account
      session[:account_id] = account.id.to_s
      redirect_to root_path, status: :see_other, notice: 'Successfully signed in!'
    else
      # TODO: support after_sign_in_path-esque behavior
      redirect_to sign_in_path, status: :see_other, alert: "Incorrect email or password, try again."
    end
  end

  def destroy
    session.delete(:account_id)
    redirect_to login_path, status: :see_other, notice: "Logged out!"
  end

  private

  def session_params
    params.require(:sign_in).permit(:email, :password)
  end
end
