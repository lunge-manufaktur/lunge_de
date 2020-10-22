# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  comment       :text
#  custom_status :string
#  ends_at       :datetime
#  manager       :boolean          default(FALSE)
#  pause         :time
#  sick          :boolean          default(FALSE)
#  starts_at     :datetime
#  vacation      :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :bigint
#  store_id      :bigint
#
# Indexes
#
#  index_events_on_employee_id  (employee_id)
#  index_events_on_store_id     (store_id)
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
