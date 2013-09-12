require_dependency 'constraints/format'
EmberTodo::Application.routes.draw do
  root :to => redirect('/projects')
  get '*tab', :to => 'application#index', constraints: Constraints::Format.new(:html)

  constraints(constraints: Constraints::Format.new(:json)) do
    resources :projects, except: [:new, :edit]
    resources :tasks, except: [:show, :new, :edit]
  end
end
