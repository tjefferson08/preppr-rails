class GroceryListsController < ApplicationController
  before_action :authenticate_account!

  layout -> { ApplicationLayout }

  def show
    active_grocery_list = current_account.active_grocery_list

    return redirect_to new_grocery_lists_path, status: :see_other, notice: "Nothing currently on list, add some items" unless active_grocery_list

    render GroceryList::ShowPageComponent.new(grocery_list: active_grocery_list)
  end

  def update
    active_grocery_list = current_account.active_grocery_list
    idx_to_remove = params.require(:remove_idx).to_i
    active_grocery_list.items_list.delete_at(idx_to_remove)
    if active_grocery_list.save
      redirect_to grocery_lists_path, status: :see_other
    else
      redirect_to grocery_lists_path, status: :unprocessable_entity, alert: "Failed to remove item"
    end
  end
end
