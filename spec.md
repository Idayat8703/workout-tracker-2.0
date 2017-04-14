
    Using Ruby on Rails for the project
    Include at least one has_many relationship (User has_many Collections)
    Include at least one belongs_to relationship (Recipe belongs_to User)
    Include at least one has_many through relationship (Recipe has_many Ingredients through Quantities)
    The "through" part of the has_many through includes at least one user submittable attribute (quantities.amount)
    Include reasonable validations for simple model objects (User, Recipe, Ingredient, Collection)
    Include a class level ActiveRecord scope method ( Recipes.most_collected URL: /recipes/most_collected)
    Include a nested form writing to an associated model using a custom attribute writer (user/:user_id/recipes/new, Quantity)
    Include signup (Devise)
    Include login (Devise)
    Include logout (Devise)
    Include third party signup/login (Devise/OmniAuth(Github))
    Include nested resource show or index (user/:user_id/collections, user/:user_id/recipes)
    Include nested resource "new" form (user/:user_id/recipes/new)
    Include form display of validation errors (form user/:user_id/recipes/new)

Confirm:

    The application is pretty DRY
    Limited logic in controllers
    Views use helper methods if appropriate
    Views use partials if appropriate
