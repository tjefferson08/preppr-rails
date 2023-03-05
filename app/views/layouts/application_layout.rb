# frozen_string_literal: true

class ApplicationLayout < ApplicationView
	include Phlex::Rails::Layout

	def template(&block)
		doctype

		html do
			head do
				title { "Sustenance Maker" }
				meta name: "viewport", content: "width=device-width,initial-scale=1"
				csp_meta_tag
				csrf_meta_tags
				stylesheet_link_tag "application", data_turbo_track: "reload"
				javascript_importmap_tags
			end

			body do
				div do
				  if helpers.flash[:notice]
					div { helpers.flash[:notice] }
				  end

				  if helpers.flash[:alert]
					div { helpers.flash[:alert] }
				  end
				end

				main(&block)
			end
		end
	end
end
