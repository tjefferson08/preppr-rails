class ImportController < ApplicationController
  def new
  end

  def import
    hsh = ImportedRecipe.new(params[:url]).to_h

    respond_to do |format|
      format.json { render json: {message: "Import success"}, status: :created }
      format.html { redirect_to new_recipe_path(recipe: hsh) }
    end
  end
end
