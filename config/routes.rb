map.namespace :admin do |admin|
  admin.resources :search_tag_clouds, :only => [:index]
end
