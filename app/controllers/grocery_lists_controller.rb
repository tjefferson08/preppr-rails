class GroceryListsController < ApplicationController
  before_action :authenticate_account!

  layout -> { ApplicationLayout }

  def show
    active_grocery_list = current_account.active_grocery_list

    return redirect_to new_grocery_lists_path, status: :see_other, notice: "Nothing currently on list, add some items" unless active_grocery_list

    render GroceryList::ShowPageComponent.new(grocery_list: active_grocery_list)
  end
end
