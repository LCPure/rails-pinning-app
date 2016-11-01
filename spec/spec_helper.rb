ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'factory_girl'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    Rails.application.load_seed # loading seeds
	FactoryGirl.reload
  end
  
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.include FactoryGirl::Syntax::Methods
  
  def login(user)
    logged_in_user = User.authenticate(user.email, user.password)
	if logged_in_user.present?
	  session[:user_id] = logged_in_user.id
	end
  end
  
  def logout(user)
    if session[:user_id] == user.id
	  session.delete(:user_id)
	end
  end
end