map.resources :blog_entries, :as => 'the-blog', :has_many => :comments
# map.connect '/the-blog/:year/:month/:day', :controller => 'blog_entry', :action => 'index'
map.namespace :admin do |admin|
  admin.resources :blog_entries, :has_many => :comments
end