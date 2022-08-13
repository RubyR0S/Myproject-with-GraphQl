Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  root "pages#find_user"
  get 'last_pages/user_form'
  get 'last_pages/user_form_async'

end
