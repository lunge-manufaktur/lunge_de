require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @product = products(:default_product)
    @hidden_product = products(:hidden_product)
  end
end