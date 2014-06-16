# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  store_id    :integer
#  starts_at   :datetime
#  ends_at     :datetime
#  pause       :time
#  vacation    :boolean          default(FALSE)
#  sick        :boolean          default(FALSE)
#  comment     :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
