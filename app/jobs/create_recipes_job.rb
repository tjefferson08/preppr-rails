class CreateRecipesJob < ApplicationJob
  DATA = [
    {
      title: "Salmon, Asparagus, and Funio",
      ingredients_list: [
        {text: "1.5 lbs salmon", quantity: 1.5, unit: 'lbs', name: 'salmon'},
        {text: "1/2 lb asparagus", quantity: 0.5, unit: 'lbs', name: 'asparagus'},
        {text: "1/2 cup funio", quantity: 0.5, unit: 'cup', name: 'funio'}
      ],
      instructions_list: ['Bake salmon @ 400f for 20 minutes', 'Roast asparagus', 'boil funio 5 for mins']
    },
    {
      title: "Stir Fry",
      ingredients_list: ["3 sweet potatoes", "1 red pepper", "1.5 cups chopped carrot", "4 cups broccoli florets"],
      instructions_list: ['Bake salmon @ 400f for 20 minutes', 'Roast asparagus', 'boil funio 5 for mins']
    },
    {
      title: "Turkey Pasta",
      ingredients_list: ["1.5 cups lentil rotini", "1 cup diced zucchini", "1/2 cup sliced mushrooms"],
      instructions_list: ['Bake salmon @ 400f for 20 minutes', 'Roast asparagus', 'boil funio 5 for mins']
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
