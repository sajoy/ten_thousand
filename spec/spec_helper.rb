ENV["RACK_ENV"] = 'test'

require('bundler/setup')
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + "/../lib/*.rb"].each {|file| require file}

RSpec.configure do |config|
  config.after(:each) do
    Skill.all.each do |s|
      s.destroy
    end
    Entry.all.each do |e|
      e.destroy
    end
    Category.all.each do |c|
      c.destory
    end
  end
end
