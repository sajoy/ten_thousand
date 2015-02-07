require('bundler/setup')
Bundler.require(:default)
also_reload("/lib/**/*.rb")
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}


# ActiveRecord::Base.default_timezone = 'Pacific Time (US & Canada)'

# home page

get '/' do
  @skills = Skill.all
  @entries = Entry.limit(5)
  erb :index
end

post '/' do
  name = params['name']
  Skill.create(name: name)
  redirect back
end

# skill view page

get '/skill/:id' do
  @skill = Skill.find(params['id'])
  @categories = Category.all
  erb :skill
end

post '/skill/:id' do
  title = params['title']
  s_id = params['id']
  cat_id = params['category']
  rating = params['rating']
  entry = Entry.create(title: title, category_id: cat_id, rating: rating, skill_id: s_id)
  skill = Skill.find(s_id)
  redirect back
end

#skill and entries edit page

get '/skill/edit/:id' do
  s_id = params['id']
  @skill = Skill.find(s_id)
  @categories = Category.all
  erb(:edit)
end

patch '/skill/edit/:id' do
  s_id = params['id']
  name = params['name']
  skill = Skill.find(s_id)
  skill.update(name: name)
  redirect back
end


delete '/skill/delete/:id' do
  skill_id = params['id']
  skill = Skill.find(skill_id)
  skill.destroy
  redirect '/'
end

patch '/skill/entry/:id' do
  e_id = params['id']
  title = params['title']
  cat_id = params['category']
  rating = params['rating']
  entry = Entry.find(e_id)
  entry.update(title: title, category_id: cat_id, rating: rating)
  redirect back
end

delete '/skill/entry/:id' do
  e_id = params['id']
  entry = Entry.find(e_id)
  entry.destroy
  redirect back
end

post '/skill/category/:id' do
  name = params['name']
  Category.create(name: name)
  redirect back
end

patch '/skill/category/:id' do
  cat_id = params['id']
  name = params['name']
  category = Category.find(cat_id)
  category.update(name: name)
  redirect back
end

delete '/skill/category/:id' do
  cat_id = params['id']
  category = Category.find(cat_id)
  category.destroy
  redirect back
end
