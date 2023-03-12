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
      ingredients_list: [
        {text: "3 medium sweet potatoes", quantity: 1, unit: "each", name: "3 medium sweet potatoes"}, {text: "1 red pepper", quantity: 1, unit: "each", name: "1 red pepper"}, {text: "1.5 cups chopped carrot", quantity: 1, unit: "each", name: "1.5 cups chopped carrot"}, {text: "4 cups broccoli florets", quantity: 1, unit: "each", name: "4 cups broccoli florets"}
      ],
      instructions_list: ['Bake salmon @ 400f for 20 minutes', 'Roast asparagus', 'boil funio 5 for mins']
    },
    {
      title: "Turkey Pasta",
      ingredients_list: [{text: "1.5 cups lentil rotini", quantity: 1, unit: "each", name: "1.5 cups lentil rotini"},
                         {text: "1 medium yellow onion", quantity: 1, unit: "each", name: "1 medium yellow onion"},
                         {text: "1 cup diced zucchini", quantity: 1, unit: "each", name: "1 cup diced zucchini"},
                         {text: "1/2 cup sliced mushrooms", quantity: 1, unit: "each", name: "1/2 cup sliced mushrooms"},
                         {text: "15 oz diced tomatoes", quantity: 1, unit: "each", name: "15 oz diced tomatoes"},
                         {text: "5oz tomato paste", quantity: 1, unit: "each", name: "5oz tomato paste"}],
      instructions_list: ["boil pasta 10 mins", "sautee vegetables 10min", "add tomatoes and reduce to sauce, 15 mins", "boil funio 5 for mins"]
    },
    {
      title: "Turkey Chili",
      ingredients_list: [
        { text: "turkey", quantity: 1, unit: 'lbs', name: "turkey" },
        { text: "corn", quantity: 1, unit: 'lbs', name: "corn" },
        { text: "onions", quantity: 1, unit: 'lbs', name: "onions" },
        { text: "canned tomatoes", quantity: 1, unit: 'lbs', name: "tomatoes" },
        { text: "beans", quantity: 1, unit: 'lbs', name: "beans" },
        { text: "garlic", quantity: 1, unit: 'lbs', name: "garlic" },
        { text: "tomato paste", quantity: 1, unit: 'lbs', name:  "tomato paste" },
        { text: "cumin", quantity: 1, unit: 'lbs', name: "cumin" },
        { text: "chili powder", quantity: 1, unit: 'lbs', name: "chii powder" },
        { text: "cayenne pepper", quantity: 1, unit: 'lbs', name: "cayene pepper" },
        { text: "avocado", quantity: 1, unit: 'lbs', name: "avocado" },
        { text: "greek yogurt", quantity: 1, unit: 'lbs', name: "greek yogurt" },
      ],
      instructions_list: ["make it all in a big ol' pot"]
    },
    {
      title: "Sweet Potato Hash",
      ingredients_list: [
        { text: "red pepper", quantity: 1, unit: "each", name: "red pepper" },
        { text: "red onion", quantity: 1, unit: "each", name: "red onion" },
        { text: "avocado", quantity: 1, unit: "each", name: "avocado" },
        { text: "breakfast sausage", quantity: 0.5, unit: "lbs", name: "breakfast sausage" },
        { text: "eggs", quantity: 4, unit: "each", name: "eggs" },
      ],
      instructions_list: ["cook potatoes first", "add onion", "cook eggs separately, then combine"]
    }
  ]

  def perform
    DATA.each do |recipe_h|
      r = Recipe.find_or_initialize_by(title: recipe_h[:title])
      r.assign_attributes(recipe_h)
      puts r.attributes if r.invalid?
      r.save!
    end
  end
end
