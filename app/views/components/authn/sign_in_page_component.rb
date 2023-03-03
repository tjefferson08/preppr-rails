# frozen_string_literal: true

class Authn::SignInPageComponent < ApplicationComponent
  include Phlex::Rails::Helpers::FormWith

  def template
    h1 { "Sign in" }
    p { "Find me in app/views/components/authn/sign_in_page_component.rb" }

    form_with(scope: :sign_in, url: sign_in_path, method: :post) do |form|
      div do
        form.label :email
        form.email_field :email
      end

      div do
        form.label :password
        form.password_field :password
      end

      form.submit "Sign in"
    end
  end
end
