ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def authenticate
    @key = api_keys(:default_api_key).key
    request.headers['Authorization'] = "Token token=#{@key}"
  end
end

class PolicyTest < ActiveSupport::TestCase
  
  def assert_permissions(current_user, record, available_actions, permissions_hash = {})
    permissions_hash.each do |action, should_be_permitted|
      if should_be_permitted
        assert_permit current_user, record, action
      else
        refute_permit current_user, record, action
      end
    end

  end

  def assert_permit(current_user, record, action)
    assert permit(current_user, record, action), "User #{current_user} should be permitted #{action} on #{record}, but isn't."
  end

  def refute_permit(current_user, record, action)
    assert refute(current_user, record, action), "User #{current_user} should NOT be permitted #{action} on #{record}, but is."
  end

  def permit(current_user, record, action)
    self.class.to_s.gsub(/Test/, "").constantize.new(current_user, record).public_send("#{action.to_s}?")
  end
  
end