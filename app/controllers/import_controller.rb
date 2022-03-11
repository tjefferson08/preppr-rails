class ImportController < ApplicationController
  def import
    ImportRecipe.new(params[:url]).run

    # TODO: html... redirect?
    respond_to do |format|
      format.json { render json: {message: "Import success"}, status: :created }
    end
  end
end
