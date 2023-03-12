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
        {text: "3 medium sweet potatoes", quantity: 1, unit: "each", name: "3 medium sweet potatoes"},
        {text: "1 red pepper", quantity: 1, unit: "each", name: "1 red pepper"},
        {text: "1.5 cups chopped carrot", quantity: 1, unit: "each", name: "1.5 cups chopped carrot"},
        {text: "4 cups broccoli florets", quantity: 1, unit: "each", name: "4 cups broccoli florets"}
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
    },
    {
      title: "Eggs, Beans, Kale",
      ingredients_list: [
        { text: "4 eggs", quantity: 4, unit: "each", name: "eggs" },
        { text: "1 can great northern beans", quantity: 1, unit: "can", name: "great northern beans" },
        { text: "6 cups chopped kale", quantity: 6, unit: "cup", name: "kale" },
      ],
      instructions_list: ["saute kale", "simmer beans", "cook eggs separately"]
    },
    {
      title: "All Good Stuff soup",
      ingredients_list: [
        {text: "1.5 cups chopped carrot", quantity: 1.5, unit: "cup", name: "carrot"},
        {text: "1.5 cups lentil rotini", quantity: 1.5, unit: "cup", name: "1.5 cups lentil rotini"},
        {text: "1.5 cups chopped celery", quantity: 1.5, unit: "cup", name: "celery"},
        {text: "1 medium yellow onion, diced", quantity: 1, unit: "each", name: "yellow onion"},
        {text: "2 cans chickpeas", quantity: 2, unit: "can", name: "chickpeas"},
        {text: "1 box vegetable broth", quantity: 32, unit: 'fl oz', name: "vegetable broth" },
        {text: "cumin", quantity: 1, unit: 'tbsp', name: "cumin" },
        {text: "italian seasoning", quantity: 1, unit: 'tbsp', name: "italian seasoning" },
      ],
      instructions_list: ["saute kale", "simmer beans", "cook eggs separately"]
    },
    {
      title: "Black bean",
      ingredients_list: [
        {2: "text poblano peppers", quantity: 1.5, unit: "cup", name: "poblano pepper"},
        {text: "1 medium yellow onion, sliced", quantity: 1.5, unit: "cup", name: "yellow onion"},
        {text: "2 cans black beans", quantity: 1, unit: "each", name: "black beans"},
        {text: "cumin", quantity: 1, unit: 'tsp', name: "cumin"},
        {text: "chili powder", quantity: 1, unit: 'tbsp', name: "chili powder"},
      ],
      instructions_list: ["saute kale", "simmer beans", "cook eggs separately"]
    },
    {
      title: "The usuals",
      ingredients_list: [
        {text: "eggs", quantity: 3, unit: "dozen", name: "eggs"},
        {text: "mushroom", quantity: 12, unit: "oz", name: "white mushrooms"},
        {text: "spindrift seltzer", quantity: 3, unit: "case", name: "seltzer"},
        {text: "apples", quantity: 1, unit: "each", name: "apples"},
        {text: "bananas", quantity: 1, unit: "each", name: "bananas"},
        {text: "pickles", quantity: 1, unit: "jar", name: "pickles"},
        {text: "hummus", quantity: 8, unit: "oz", name: "hummus"},
        {text: "organic 2% milk", quantity: 64, unit: "oz", name: "milk"},
        {text: "organic almond milk", quantity: 32, unit: "oz", name: "almond milk"},
        {text: "organic oat milk", quantity: 32, unit: "oz", name: "oat milk"},
        {text: "chipssss", quantity: 1, unit: "bag", name: "potato chips"},
        {text: "cottage cheese", quantity: 1, unit: "quart", name: "cottage cheese"},
        {text: "roasted almonds", quantity: 16, unit: "oz", name: "roasted almonds"},
        {text: "2 sweet potatoes for emergency fries", quantity: 2, unit: "each", name: "sweet potatoes"},
      ],
      instructions_list: ["buy the stuff"]
    },
    # {
    #   title: "Assorted Spices",
    #   ingredients_list: [
    #     {text: "cumin", quantity: 1, unit: 'tsp', name: "cumin"},
    #     {text: "chili powder", quantity: 1, unit: 'tbsp', name: "chili powder"},
    #     {text: "italian seasoning", quantity: 1, unit: 'tbsp', name: "italian seasoning"},
    #   ]
    # }
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
