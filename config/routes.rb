Rails.application.routes.draw do
     # get 'demo/index'
    # root "demo#index"
    root "demo#index"
    match ':controller(/:action(/:id))', :via => [:get, :post]
end
