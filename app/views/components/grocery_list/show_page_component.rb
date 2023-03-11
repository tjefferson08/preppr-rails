class GroceryList::ShowPageComponent < ApplicationComponent
  def initialize(grocery_list:)
    @grocery_list = grocery_list
  end

  def template
    h1 { "My Grocery List" }

    ul do
      @grocery_list.items_list.each do |item|
        li { item }
      end
    end
  end
end
