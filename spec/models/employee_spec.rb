# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  active     :boolean          default(TRUE)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Employee do
  pending "add some examples to (or delete) #{__FILE__}"
end
