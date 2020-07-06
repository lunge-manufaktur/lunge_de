# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Employee do
  pending "add some examples to (or delete) #{__FILE__}"
end
