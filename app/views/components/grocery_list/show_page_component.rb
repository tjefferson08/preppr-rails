class GroceryList::ShowPageComponent < ApplicationComponent
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::ClassNames

  def initialize(grocery_list:)
    @grocery_list = grocery_list
  end

  def template
    h1 { "My Grocery List" }

    ul do
      @grocery_list.items_list.each_with_index do |item, idx|
        li(class: class_names("inline-flex bg-red-500")) do
          span { item }
          button_to(grocery_lists_url, method: :put, name: "remove_idx", value: idx) { "Remove" }
        end
      end
    end
  end
end
