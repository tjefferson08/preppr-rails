class CreateRecipesJob < ApplicationJob
  DATA = [
    {
      title: "Salmon, Asparagus, and Funio",
      ingredients_list: ["1.5 lbs salmon", "1 bunch asparagus", "1/2 cup funio"],
      instructions_list: []
    },
    {
      title: "Stir Fry",
      ingredients_list: ["3 sweet potatoes", "1 red pepper", "1.5 cups chopped carrot", "4 cups broccoli florets"],
      instructions_list: []
    },
    {
      title: "Turkey Pasta",
      ingredients_list: ["1.5 cups lentil rotini", "1 cup diced zucchini", "1/2 cup sliced mushrooms"],
      instructions_list: []
    }
  ]

  def perform
    DATA.each do |recipe_h|
      r = Recipe.find_or_initialize_by(title: recipe_h[:title])
      r.assign_attributes(recipe_h)
      r.save!
    end
  end
end
