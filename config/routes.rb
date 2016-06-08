Rails.application.routes.draw do

    # get 'demo/index'
    # root "demo#index"
    root "demo#index"
    get 'admin', :to => 'access#index'
    match ':controller(/:action(/:id))', :via => [:get, :post]
end
