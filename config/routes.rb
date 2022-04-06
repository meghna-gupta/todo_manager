Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "todos", to: "todos#index"
  # get "todos/:id", to: "todos#show"
  get "todo", to: "todos#basic"
  get "todo-manager", to: "todos#manager"
  get "todo-manager/:id", to: "todos#managerShow"
end

# First, look in public folder
# Second, look in routes.rb
# No file in public folder, goes to asset pipeline

# MVC Framework
# Request comes to routes.rb
# routes.rb decides which controller to call, based on the request.
# everything is done by the controller, figures out what to render, which db etc.

### Best Practices
# Keep the controllers thin:
#  - there should not be too much logic in the controller
#  - move most of the domain logic into the model
# ideal purpose of controller:
#  - parse the parameter
#  - call the appropriate model method
#  - render the correct view
# move logic into the service part, for large applications
